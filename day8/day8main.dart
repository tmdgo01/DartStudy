import 'dart:convert';
import 'dart:io';

void printhttpserveractivated(HttpServer server) {
  var ip = server.address.address;
  var port = server.port;
  print("Server started at $ip:$port");
}

Future<void> printhttprequestinfo(HttpRequest request) async {
  var ip = request.connectionInfo!.remoteAddress.address;
  var port = request.connectionInfo!.remotePort;
  var method = request.method;
  var path = request.uri.path;
  print("[$method] $path from $ip:$port");
  if (request.headers.contentLength != -1) {
    print("Content-Type: ${request.headers.contentType}");
    print("Content-Length: ${request.headers.contentLength}");
  }
}

Future<void> printandsendhttpresponse(var db, var request, var content) async {
  print('\n $content \nCurrent DB: $db');
  request.response
    ..headers.contentType = ContentType('text', 'plain', charset: "utf-8")
    ..headers.contentLength = content.length
    ..statusCode = HttpStatus.ok
    ..write(content);
  await request.response.close();
}

Future<void> createDB(Map db, HttpRequest request) async {
  var content = await utf8.decoder.bind(request).join();
  var transaction = jsonDecode(content) as Map;
  var key = transaction.keys.first;
  var value = transaction[key];

  String response;
  if (!db.containsKey(key)) {
    db[key] = value;
    response = "Created: $key = $value";
  } else {
    response = "Error: $key already exists";
  }

  await printandsendhttpresponse(db, request, response);
}

Future<void> readDB(Map db, HttpRequest request) async {
  var key = request.uri.queryParameters['key'];
  var content = "";

  if (key != null && db.containsKey(key)) {
    content = "Read: $key = ${db[key]}";
  } else if (key != null && !db.containsKey(key)) {
    content = "Error: $key not found";
  } else {
    content = "All Data: $db";
  }

  await printandsendhttpresponse(db, request, content);
}

// 현재 코드에서 updateDB 부분은 수정할 데이터가 들어가 있는 값을 body에 넣어서 사용 중
// 이 부분을 수정할 데이터의 key 값을 요청의 마지막 부분에 담아서 수정하려 한다.
// 예를 들어, PUT 127.0.0.1:4040/api/0001
// 예시의 방식을 이용하여 key 값을 조회
// body에 {"data" : "Cheongju"} 를 입력했을 때 key 값을 수정
// 수정 전 코드 :
// Future<void> updateDB(Map db, HttpRequest request) async {
//   var content = await utf8.decoder.bind(request).join();
//   var transaction = jsonDecode(content) as Map;
//   var key = transaction.keys.first;
//   var value = transaction[key];

//   String response;
//   if (db.containsKey(key)) {
//     db[key] = value;
//     response = "Updated: $key = $value";
//   } else {
//     response = "Error: $key does not exist";
//   }

//   await printandsendhttpresponse(db, request, response);
// }
Future<void> updateDB(Map db, HttpRequest request) async {
  var key = request.uri.pathSegments.last;
  var content = await utf8.decoder.bind(request).join();
  var body = jsonDecode(content) as Map;
  var value = body['data'];

  String response;
  if (db.containsKey(key)) {
    db[key] = value;
    response = "Updated: $key = $value";
  } else {
    response = "Error: $key does not exist";
  }

  await printandsendhttpresponse(db, request, response);
}

Future<void> deleteDB(Map db, HttpRequest request) async {
  var content = await utf8.decoder.bind(request).join();
  var transaction = jsonDecode(content) as Map;
  var key = transaction.keys.first;

  String response;
  if (db.containsKey(key)) {
    db.remove(key);
    response = "Deleted: $key";
  } else {
    response = "Error: $key not found";
  }

  await printandsendhttpresponse(db, request, response);
}

Future<void> main() async {
  var db = <String, String>{};
  var server = await HttpServer.bind(InternetAddress.loopbackIPv4, 4040);
  printhttpserveractivated(server);

  await for (HttpRequest request in server) {
    printhttprequestinfo(request);

    if (request.uri.path.startsWith('/api')) {
      try {
        switch (request.method) {
          case 'GET':
            await readDB(db, request);
            break;
          case 'POST':
            await createDB(db, request);
            break;
          case 'PUT':
            await updateDB(db, request);
            break;
          case 'DELETE':
            await deleteDB(db, request);
            break;
          default:
            await printandsendhttpresponse(
              db,
              request,
              "Unsupported HTTP method",
            );
        }
      } catch (e) {
        await printandsendhttpresponse(db, request, "Error: $e");
      }
    } else {
      request.response
        ..statusCode = HttpStatus.notFound
        ..write("Unsupported URI")
        ..close();
    }
  }
}
