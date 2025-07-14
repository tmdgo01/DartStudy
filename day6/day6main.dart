import 'dart:convert';
import 'dart:io';

void main() {
  // 한글 인식 가능 : utf8
  stdout.write("[안녕하세요. 출력하실 내용을 입력해주세요: ]");
  var userInput = stdin.readLineSync(encoding: utf8);
  stdout.writeln("입력 값 : $userInput");

  while (userInput != "[그만]") {
    stdout.write("[안녕하세요. 출력하실 내용을 입력해주세요: ]");
    userInput = stdin.readLineSync(encoding: utf8);
    stdout.writeln("입력 값 : $userInput");
  }
  stdout.writeln("[프로그램을 종료합니다.]");

  var ilist = <int>[];

  // 첫 번째 숫자
  stdout.write("숫자 입력: ");
  var input = stdin.readLineSync();
  ilist.add(int.parse(input!));

  // 두 번째 숫자
  stdout.write("더할 숫자 입력: ");
  input = stdin.readLineSync();
  ilist.add(int.parse(input ?? '1'));

  stdout.writeln("결과1 : ${ilist[0]} + ${ilist[1]} = ${ilist[0] + ilist[1]}");

  // 문자열로 숫자 두 개 입력
  stdout.write("숫자 입력(예: 3,3): ");
  var slist = <String>[];
  var input2 = stdin.readLineSync();
  slist = input2!.split(',');

  for (var item in slist) {
    ilist.add(int.parse(item));
  }

  stdout.writeln("결과2 : ${slist[0]} + ${slist[1]} = ${slist[0] + slist[1]}");

  var n1 = int.parse(slist[0]);
  var n2 = int.parse(slist[1]);
  stdout.writeln("결과3 : $n1 + $n2 = ${n1 + n2}");
}
