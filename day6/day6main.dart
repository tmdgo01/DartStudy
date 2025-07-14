import 'dart:convert';
import 'dart:io';

void main() {
  stdout.write("입력 ");
  // 한글 인식 가능
  var userInput = stdin.readLineSync(encoding: utf8);
  stdout.writeln("입력 값: $userInput");

  while (userInput != "exit") {
    stdout.write("입력");
    userInput = stdin.readLineSync(encoding: utf8);
    stdout.writeln("입력 값 : $userInput");
  }
}
