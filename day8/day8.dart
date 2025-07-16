// 기존에 학습했던 http 코드들을 참고하여 사용자를 CRUD 할 수 있는 RESTful 프로그램을 작성하고자 합니다.
// 다음의 코드들을 참고하여 RESTful 프로그램을 완성하세요.
// 서버의 포트는 3000번 포트를 이용하며,
// 각 API들은 /user 를 이용하여 호출이 되어야 합니다.

import 'dart:convert';
import 'dart:io';

Future<void> create(Map database, HttpRequest request) async {
  var content = await utf8.decoder.bind(request).join();
  var transaction = jsonDecode(content) as Map;
  var key = transaction.keys.first;
  var value = transaction[key];

  String response;
  if (!database.containsKey(key)) {
    database[key] = value;
    response = "Created: $key = $value";
  } else {
    response = "Error: $key already exists";
  }

  await printAndSendHttpResponse(database, request, response);
}

Future<void> read(Map database, HttpRequest request) async {
  var key = request.uri.queryParameters['key'];
  var content = "";

  if (key != null && database.containsKey(key)) {
    content = "Read: $key = ${database[key]}";
  } else if (key != null && !database.containsKey(key)) {
    content = "Error: $key not found";
  } else {
    content = "All Data: $database";
  }

  await printAndSendHttpResponse(database, request, content);
}

Future<void> update(Map database, HttpRequest request) async {
  var key = request.uri.pathSegments.last;
  var content = await utf8.decoder.bind(request).join();
  var body = jsonDecode(content) as Map;
  var value = body['data'];

  String response;
  if (database.containsKey(key)) {
    database[key] = value;
    response = "Updated: $key = $value";
  } else {
    response = "Error: $key does not exist";
  }

  await printAndSendHttpResponse(database, request, response);
}

Future<void> delete(Map database, HttpRequest request) async {
  var content = await utf8.decoder.bind(request).join();
  var transaction = jsonDecode(content) as Map;
  var key = transaction.keys.first;

  String response;
  if (database.containsKey(key)) {
    database.remove(key);
    response = "Deleted: $key";
  } else {
    response = "Error: $key not found";
  }

  await printAndSendHttpResponse(database, request, response);
}

Future main() async {
  var database = <dynamic, dynamic>{};

  var server = await HttpServer.bind(InternetAddress.loopbackIPv4, 3000);

  printHttpServerActivated(server);

  await for (HttpRequest request in server) {
    if (request.uri.path.contains('/user') == true) {
      printHttpRequestInfo(request);

      try {
        switch (request.method) {
          case 'POST':
            await create(database, request);
            break;
          case 'GET':
            await read(database, request);
            break;
          case 'PUT':
            await update(database, request);
            break;
          case 'DELETE':
            await delete(database, request);
            break;
          default:
            print("\$ 지원하지 않는 메서드입니다.");
            break;
        }
      } catch (err) {
        print("\$ 요청 수행 중 에러가 발생했습니다.");
      }
    } else {
      printAndSendHttpResponse(
        database,
        request,
        "${request.method} {에러: 지원하지 않는 API 입니다.}",
      );
    }
  }
}

Future<void> printHttpServerActivated(HttpServer server) async {
  var ip = server.address.address;
  var port = server.port;

  print('\$ Server activated in $ip:$port');
}

Future<void> printHttpRequestInfo(HttpRequest request) async {
  var ip = request.connectionInfo!.remoteAddress.address;
  var port = request.connectionInfo!.remotePort;
  var method = request.method;
  var path = request.uri.path;

  print('\$ $method $path from $ip:$port');

  if (request.headers.contentLength != -1) {
    print('\> content-type: ${request.headers.contentType}');
    print('\> content-lendth: ${request.headers.contentLength}');
  }
}

Future<void> printAndSendHttpResponse(
  Map database,
  HttpRequest request,
  String content,
) async {
  print("\$ $content \n current DB      : $database");
  request.response
    ..headers.contentType = ContentType('text', 'plain', charset: 'utf-8')
    ..headers.contentLength = content.length
    ..statusCode = HttpStatus.ok
    ..write(content);

  await request.response.close();
}
