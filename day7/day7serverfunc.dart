import 'dart:io';
import 'dart:convert';

void printhttpserveractivated(HttpServer server) {
  var ip = server.address.address;
  var port = server.port;

  print("$ip:$port");
}

void printhttprequestinfo(HttpRequest request) async {
  var ip = request.connectionInfo!.remoteAddress.address;
  var port = request.connectionInfo!.remotePort;
  var method = request.method;
  var path = request.uri.path;

  print("$method $path from $ip : $port");

  if (request.headers.contentLength != -1) {
    print(request.headers.contentType);
    print(request.headers.contentLength);
  }
}

void httpgethandler(HttpRequest request) async {
  if (request.uri.path == '/') {
    var content = "home";
    request.response
      ..headers.contentType = ContentType('text', 'plain', charset: "utf-8")
      ..headers.contentLength = content.length
      ..statusCode = HttpStatus.ok
      ..write(content);
  } else if (request.uri.path.contains('/add')) {
    var vars = request.uri.path.split(',');
    var result = int.parse(vars[1]) + int.parse(vars[2]);
    var content = "${vars[1]} + ${vars[2]} = $result";
    request.response
      ..headers.contentType = ContentType('text', 'plain', charset: "utf-8")
      ..headers.contentLength = content.length
      ..statusCode = HttpStatus.ok
      ..write(content);
  } else if (await File(request.uri.path.substring(1)).exists() == true) {
    var file = File(request.uri.path.substring(1));
    var content = await file.readAsString();
    request.response
      ..headers.contentType = ContentType('text', 'plain', charset: "utf-8")
      ..headers.contentLength = content.length
      ..statusCode = HttpStatus.ok
      ..write(content);
  } else {
    var content = "Unsupported URI";
    request.response
      ..headers.contentType = ContentType('text', 'plain', charset: "utf-8")
      ..headers.contentLength = content.length
      ..statusCode = HttpStatus.notFound
      ..write(content);
  }
  await request.response.close();
}

void httpputhandler(var addr, var port, HttpRequest request) async {
  var content = await utf8.decoder.bind(request).join();
  var file = await File(request.uri.path.substring(1)).openWrite();
  print("\> content            : $content");
  file
    ..write(content)
    ..close();
  content = "http://$addr:$port/${request.uri.path.substring(1)} created";
  request.response
    ..headers.contentType = ContentType('text', 'plain', charset: "utf-8")
    ..headers.contentLength = content.length
    ..statusCode = HttpStatus.ok
    ..write(content);

  await request.response.close();
}

void httpposthandler(HttpRequest request) async {
  var content = await utf8.decoder.bind(request).join();
  var product = content.split("=");
  print("\> content            : $content");
  content = "Product '${product[1]} accepted'";
  request.response
    ..headers.contentType = ContentType('text', 'plain', charset: "utf-8")
    ..headers.contentLength = content.length
    ..statusCode = HttpStatus.ok
    ..write(content);
  await request.response.close();
}

void httpdeletehandler(HttpRequest request) async {
  var filename = request.uri.path.substring(1);
  if (await File(filename).exists() == true) {
    var content = "File '$filename' deleted";
    File(filename).deleteSync();
    request.response
      ..headers.contentType = ContentType('text', 'plain', charset: "utf-8")
      ..headers.contentLength = content.length
      ..statusCode = HttpStatus.ok
      ..write(content);
  } else {
    var content = "File '$filename' not found";
    request.response
      ..headers.contentType = ContentType('text', 'plain', charset: "utf-8")
      ..headers.contentLength = content.length
      ..statusCode = HttpStatus.notFound
      ..write(content);
  }
  await request.response.close();
}

Future main() async {
  var server = await HttpServer.bind(InternetAddress.loopbackIPv4, 4040);
  printhttpserveractivated(server);
  await for (HttpRequest request in server) {
    printhttprequestinfo(request);
    try {
      switch (request.method) {
        case 'GET':
          httpgethandler(request);
          break;
        case 'PUT':
          httpputhandler(server.address.address, server.port, request);
          break;
        case 'POST':
          httpposthandler(request);
          break;
        case 'DELETE':
          httpdeletehandler(request);
          break;
        default:
          request.response
            ..statusCode = HttpStatus.methodNotAllowed
            ..write("Method not allowed");
          await request.response.close();
      }
    } catch (e) {
      print("\$ Exception in http request processing: $e");
    }
  }
}
