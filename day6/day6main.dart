import 'dart:convert';
import 'dart:io';

void main() {
  // 한글 인식 가능 : utf8
  stdout.write("[안녕하세요. 출력하실 내용을 입력해주세요: ]");
  var userInput = stdin.readLineSync(encoding: utf8);
  stdout.writeln("입력 값 : $userInput");

  while (userInput != "stop") {
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

  // 문제 2
  // 다음은 이 프로그램의 실행 결과입니다. 실행 결과에 맞는 코드 작성
  // 숫자 입력:
  // 곱할 숫자 입력:
  // 결과:
  // 다음 곱셈을 준비할까요? (y/n):

  stdout.write("숫자 입력: ");
  var firstnum = int.parse(stdin.readLineSync()!);

  stdout.write("곱할 숫자 입력: ");
  var secondnum = int.parse(stdin.readLineSync()!);

  stdout.writeln("결과: $firstnum * $secondnum = ${firstnum * secondnum}");

  stdout.write("다음 곱셈을 준비할까요? (y/n): ");
  var againstinput = stdin.readLineSync();

  while (againstinput == 'y' || againstinput == 'Y') {
    stdout.write("숫자 입력: ");
    firstnum = int.parse(stdin.readLineSync()!);
    stdout.write("곱할 숫자 입력: ");
    secondnum = int.parse(stdin.readLineSync()!);
    stdout.writeln("결과: $firstnum * $secondnum = ${firstnum * secondnum}");
    stdout.write("다른 수를 곱할 까요? (y/n): ");
    againstinput = stdin.readLineSync();
  }

  // 식단표 출력 프로그램
  // 날짜 입력:
  // 급식을 진행하지 않는 날입니다.
  // 다른 날짜의 급식을 출력할까요? (y/n)
  // 날짜 입력:
  // 0월 0일 식단표 [보리밥, 콩자반, 돼지갈비, 열무 김치, 된장국, 두유]
  // 다른 날짜의 급식을 출력할까요? (y/n)
  // [프로그램을 종료합니다.]

  Map<String, List<String>> dietMenu = {
    "1월 1일": ["보리밥", "콩자반", "돼지갈비", "열무 김치", "된장국", "두유"],
    "6월 29일": ["김치 볶음밥", "계란후라이", "무생채", "미역국", "요구르트"],
  };
  stdout.write("날짜 입력: ");
  var dateInput = stdin.readLineSync();
  while (dateInput != null && dateInput.isNotEmpty) {
    if (dietMenu.containsKey(dateInput)) {
      stdout.writeln("$dateInput 식단표: ${dietMenu[dateInput]}");
    } else {
      stdout.writeln("급식을 진행하지 않는 날입니다.");
    }
    stdout.write("다른 날짜의 급식을 출력할까요? (y/n): ");
    var continueInput = stdin.readLineSync();
    if (continueInput == 'n' || continueInput == 'N') {
      break;
    }
    stdout.write("날짜 입력: ");
    dateInput = stdin.readLineSync();
  }
}
