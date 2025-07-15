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
  }
}

Future main() async {}
