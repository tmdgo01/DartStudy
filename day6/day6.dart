import 'dart:io';

void main() {
  stdout.write("입력 ");
  var userInput = stdin.readLineSync();

  stdout.writeln("입력 값: $userInput");
}
