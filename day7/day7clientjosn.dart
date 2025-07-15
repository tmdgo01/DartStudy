import 'dart:io';
import 'dart:convert';

void printhttprequestinfo(HttpClientResponse response, String content) {
  print("Response Status: ${response.statusCode}");
  print("Response Content-Type: ${response.headers.contentType}");
  print("Response Content-Length: ${response.headers.contentLength}");
  print("Response Content: $content");
}

Future main() async {
  var serverip = InternetAddress.loopbackIPv4.address;
  var serverport = 30000;
  var serverpath;
  var httpclient = HttpClient();
  var httpresponsecontent;
  var httpcontent;

  HttpClientRequest httprequest;
  HttpClientResponse httpresponse;

  print("|-> POST JSON Format");
  Map jsoncontent = {
    "Korea": "Seoul",
    "USA": "Washington DC",
    "Japan": "Tokyo",
    "China": "Beijing",
  };
  var content = jsonEncode(jsoncontent);

  serverpath = "/";

  print("|-> Get/");
  serverpath = "";
  httprequest = await httpclient.get(serverip, serverport, serverpath);
  httpresponse = await httprequest.close();
  httpresponsecontent = await utf8.decoder.bind(httpresponse).join();
  printhttprequestinfo(httpresponse, httpresponsecontent);

  print("|-> GET /add, 3, 4");
  serverpath = "/add/3/4";
  httprequest = await httpclient.get(serverip, serverport, serverpath);
  httpresponse = await httprequest.close();
  httpresponsecontent = await utf8.decoder.bind(httpresponse).join();
  printhttprequestinfo(httpresponse, httpresponsecontent);

  print("|-> GET /sample.txt");
  serverpath = "/sample.txt";
  httprequest = await httpclient.get(serverip, serverport, serverpath);
  httpresponse = await httprequest.close();
  httpresponsecontent = await utf8.decoder.bind(httpresponse).join();
  printhttprequestinfo(httpresponse, httpresponsecontent);

  print("|-> POST item=product#1212");
  httpcontent = "item=product#1212";
  serverpath = "/";
  httprequest = await httpclient.post(serverip, serverport, serverpath)
    ..headers.contentType = ContentType('text', 'plain', charset: "utf-8")
    ..headers.contentLength = httpcontent.length
    ..write(httpcontent);
  httpresponse = await httprequest.close();
  httpresponsecontent = await utf8.decoder.bind(httpresponse).join();
  printhttprequestinfo(httpresponse, httpresponsecontent);

  print("|-> PUT /timestamp.txt");
  httpcontent = "created at ${DateTime.now()}";
  serverpath = "/timestamp.txt";
  httprequest = await httpclient.put(serverip, serverport, serverpath)
    ..headers.contentType = ContentType('text', 'plain', charset: "utf-8")
    ..headers.contentLength = httpcontent.length
    ..write(httpcontent);
  httpresponse = await httprequest.close();
  httpresponsecontent = await utf8.decoder.bind(httpresponse).join();
  printhttprequestinfo(httpresponse, httpresponsecontent);

  print("|-> DELETE /timestamp.txt");
  serverpath = "/timestamp.txt";
  httprequest = await httpclient.delete(serverip, serverport, serverpath);
  httpresponse = await httprequest.close();
  httpresponsecontent = await utf8.decoder.bind(httpresponse).join();
  printhttprequestinfo(httpresponse, httpresponsecontent);
}
