import 'dart:convert';
import 'dart:io';
import 'dart:math';

void main() async {
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

  stdout.write("숫자 입력(예: 3,3): ");

  try {
    var input2 = stdin.readLineSync();

    if (input2 == null || !input2.contains(',')) {
      throw FormatException();
    }

    var slist = input2.split(',');
    if (slist.length != 2) {
      throw FormatException();
    }

    var n1 = int.parse(slist[0].trim());
    var n2 = int.parse(slist[1].trim());

    stdout.writeln(
      "결과1 : ${slist[0]} + ${slist[1]} = ${slist[0].trim() + slist[1].trim()}",
    ); // 문자열 덧셈
    stdout.writeln("결과2 : $n1 + $n2 = ${n1 + n2}"); // 숫자 덧셈
  } catch (e) {
    stdout.writeln("잘못된 입력 형식입니다. 숫자를 쉼표로 구분하여 입력해주세요.");
  }

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

  while (againstinput == 'y') {
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
  Map<String, List<String>> menu = {
    "1월 1일": ["보리밥", "돼지갈비", "열무 김치", "된장국", "두유"],
    "1월 2일": ["현미밥", "장조림", "오이소박이", "부대찌개", "여름 자두"],
    "6월 29일": ["김치 볶음밥", "계란후라이", "무생채", "미역국", "요구르트"],
  };

  while (true) {
    stdout.write("날짜를 입력하세요 (ex. 1월 1일): ");
    String? dateInput = stdin.readLineSync(encoding: utf8);

    if (dateInput == null || dateInput.trim().isEmpty) {
      stdout.writeln("입력이 없습니다. 프로그램을 종료합니다.");
      break;
    }

    if (menu.containsKey(dateInput)) {
      stdout.writeln("\n[$dateInput 식단표]");
      for (var item in menu[dateInput]!) {
        stdout.writeln("- $item");
      }
    } else {
      stdout.writeln("해당 날짜에는 급식이 없습니다.");
    }

    stdout.write("\n다른 날짜도 확인할까요? (y/n): ");
    String? continueInput = stdin.readLineSync(encoding: utf8);

    if (continueInput == 'n') {
      stdout.writeln("[프로그램을 종료합니다.]");
      break;
    } else if (continueInput != 'y') {
      stdout.writeln("잘못된 입력입니다. 프로그램을 종료합니다.");
      break;
    }

    stdout.writeln(""); // 줄 바꿈
  }

  // [System]와 가위바위보
  // 3 선승제
  // 내 점수: , [System] 점수:
  // 프로그램 종료
  var choices = ['가위', '바위', '보'];
  var userScore = 0;
  var computerScore = 0;
  var rounds = 0;
  var rng = Random();
  stdout.writeln("게임을 시작한다. 3번 먼저 이겨야 산다.");
  // 3 선승
  while (userScore < 3 && computerScore < 3) {
    stdout.write("가위, 바위, 보!: ");
    var userChoice = stdin.readLineSync(encoding: utf8);

    if (userChoice == null || !choices.contains(userChoice)) {
      stdout.writeln("장난하나. 다시.");
      continue;
    }
    // import 'dart:math'
    var computerChoice = choices[rng.nextInt(3)];
    stdout.writeln("[System]: $computerChoice");

    if (userChoice == computerChoice) {
      stdout.writeln("다시.");
    } else if ((userChoice == '가위' && computerChoice == '보') ||
        (userChoice == '바위' && computerChoice == '가위') ||
        (userChoice == '보' && computerChoice == '바위')) {
      userScore++;
      stdout.writeln("꽤 하는군. 현재 점수: $userScore, [System]: $computerScore");
    } else {
      computerScore++;
      stdout.writeln("별 거 아니군. 현재 점수: $userScore, [System]: $computerScore");
    }

    rounds++;
  }
  stdout.writeln(
    "[System]: 게임 종료! 당신의 점수: $userScore, [System]: $computerScore",
  );
  if (userScore > computerScore) {
    stdout.writeln("축하합니다! 이겼습니다. 당신은 무사히 이 세계를 살아갈 수 있습니다.");
  } else if (computerScore > userScore) {
    stdout.writeln("[System]이 이겼습니다. 당신이 사망합니다.");
  } else {
    stdout.writeln("무승부입니다. 다음에 다시 도전하세요!");
  }
  stdout.writeln("총 $rounds 라운드가 진행되었습니다.");
  stdout.writeln("가위바위보 세계를 종료합니다.");

  var result = await readFileToString("C:/Users/ASD/Desktop/test/day6/src.txt");
  print(result);
}

Future<String> readFileToString(String filename) async {
  var file = File(filename);
  String fileContent = await file.readAsString();
  return fileContent;
}
