import 'dart:io';
import 'dart:async';
import 'dart:math';

Future<int> async1() async {
  print("async1 : 1 sec left");
  await Future.delayed(Duration(seconds: 1));
  print("async1 finished");

  return 10;
}

Future<int> async2() async {
  print("async2 : 2 sec left");
  await Future.delayed(Duration(seconds: 2));
  print("async2 finished");

  return 10;
}

Future<int> async3() async {
  print("async3 : 3 sec left");
  await Future.delayed(Duration(seconds: 3));
  print("async3 finished");

  return 10;
}

void main() async {
  List<String> fruits = ["Apple is Green", "  Banana n  ", "AppleMango"];
  print("AppleMango in List? : ${fruits.contains("AppleMango")}");
  print("Starts with Apple? : ${fruits[0].startsWith("Apple")}");
  print("Ends with 'Green'? : ${fruits[0].endsWith("Green")}");
  print("Index of 'Green' : ${fruits[0].indexOf("Green")}");
  print("Trim '  Bananan  ' : ${fruits[1].trim()}");

  String os = Platform.operatingSystem;
  String path = Platform.script.toFilePath();
  print("os : $os");
  print("path : $path");

  print("max(2, 4) : ${max(2, 4)}");
  print("min(2, 4) : ${min(2, 4)}");
  print("e : $e");
  print("pi : $pi");

  var t1 = DateTime.now();

  Future.wait([async1(), async2(), async3()])
      .then((List<int> nums) {
        var t2 = DateTime.now();

        var sum = nums.reduce((curr, next) => curr + next);
        print('sum : $sum < time ${t2.difference(t1)} >');
      })
      .catchError(print);

  var ip = InternetAddress.loopbackIPv4;
  var port = 4040;

  var server = await HttpServer.bind(ip, port);

  await for (HttpRequest request in server) {
    try {
      // http://127.0.01:4040/에서 ip와 port를 제외한 이후 문자열이 /만 있는지 확인
      if (request.uri.path == '/') {
        print('\$ http response');
        print("\$ 200 OK");

        request.response
          ..statusCode = HttpStatus.ok
          ..write("I wanna go home");
      } else if (request.uri.path.contains("'/add'")) {
        print("\$ http response is result of 'add' operation");
        print("\$ send 200 OK");

        var varlist = request.uri.path.split(',');
        var result123 = int.parse(varlist[1]) + int.parse((varlist[2]));

        request.response
          ..statusCode = HttpStatus.ok
          ..write("${varlist[1]} + ${varlist[2]} = ${result123}");
      } else if (await File(request.uri.path.substring(1)).exists() == true) {
        print("\$ http response is ${request.uri.path} file transfer");
        print("\$ send 200 ok");

        var file = File(request.uri.path.substring(1));
        var filecontent = await file.readAsString();

        request.response
          ..statusCode = HttpStatus.ok
          ..headers.contentType = ContentType('text', 'plain', charset: "utf-8")
          ..write(filecontent);
      } else {
        print("\$ unsupported uri");
        print("\$ send 404 not found");

        request.response
          ..statusCode = HttpStatus.notFound
          ..write("Unsupported URI");
      }
      await request.response.close();
    } catch (e) {
      print("error $e");
    }
  }

  print("server activated : ${server.address.address}, ${server.port}");
}
