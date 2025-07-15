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

void main() {
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
}
