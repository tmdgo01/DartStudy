import 'dart:ffi';

void main() {
  // 복습
  // 정수형 변수 선언
  int num1 = 10;

  // 실수형 변수 선언
  double num2 = 20.5;

  // 값을 변경할 수 없는 변수
  const num3 = 123; // 선언 시점에 값이 있어야 함
  final num4 = 456.78;

  // 값을 유동적으로 변경할 수 있는 변수
  var num5 = 789; // 선언 시점에 값이 없어도 됨
  dynamic num6 = 1000; // 어떤 타입의 값도 가질 수 있음
  num6 = "Hello, Dart!"; // 값 변경 가능

  // 연산자
  // 문자 출력
  // 줄 바꿈(개행)
  print("\n or 큰따옴표 3개로 묶기");

  var a = 1 == 1;
  print(a); // true
  var b = 1 == '1';
  print(b); // false, 타입이 다르기 때문

  bool c = 1 == 1;
  bool d = 1 == '2';
  print(c && d); // false, 둘 다 true가 아니므로 false
  print(c || d); // true, 둘 중 하나가 true이므로 true
  print(!c); // false, a가 true이므로 반전하여 false

  bool e = 1 > 0;
  bool f = 2 < 1;
  print(e); // true, 1은 0보다 큼
  print(f); // false, 2는 1보다 작지 않음

  bool g = 1 >= 1;
  bool h = 2 <= 1;
  print(g); // true, 1은 1보다 크거나 같음
  print(h); // false, 2는 1보다 작거나 같지 않음

  bool i = 1 != 1;
  bool j = 2 != 1;
  print(i); // false, 1은 1이므로 같음
  print(j); // true, 2는 1이 아니므로 다름

  // if문
  if (i) {
    print("yo man");
  } else if (j) {
    print("yo man2");
  } else {
    print('a는 false입니다.');
  }

  // switch문
  String day = '화요일';
  switch (day) {
    case '월요일':
      print('오늘은 월요일입니다.');
      break;
    case '화요일':
      print('오늘은 화요일입니다.');
      break;
    default:
      print('오늘은 다른 요일입니다.');
      break;
  }

  // TODO: switch문을 if else if로 변환
  String day2 = '수요일';
  if (day2 == '월요일') {
    print('오늘은 월요일입니다.');
  } else if (day2 == '화요일') {
    print('오늘은 화요일입니다.');
  } else {
    print('오늘은 다른 요일입니다.');
  }

  var programTermination = 'NORMAL'; // 프로그램 종료 상태
  assert(programTermination == 'NORMAL', '프로그램이 정상 종료되지 않았습니다.');
  print("[19] program terminated in nomal");
  // assert는 사용이 드묾 > 앱 종료가 되어버리기 때문에

  // 반복문
  var number = 0;
  for (number = 0; number < 3; number++) {
    print("yo");
  }

  // TODO: for문으로 구구단 1단 출력
  for (int i = 1; i <= 9; i++) {
    print("1 x $i = ${1 * i}");
  }

  // 1단부터 9단까지 출력
  for (int j = 1; j <= 9; j++) {
    print("$j단");
    for (int k = 1; k <= 9; k++) {
      print("$j x $k = ${j * k}");
    }
    print("");
  }

  // while문
  int count = 1;
  int number2 = 1;

  while (count <= 3) {
    print("$number2 x $count = ${number2 * count}");
    count++;
  }

  // do while문
  do {
    print("dowhile : $number2 x $count = ${number2 * count}");
    count++;
  } while (count <= 6);

  // continue와 break
  for (count = number = 1; number <= 9; number++) {
    if (number > 4) {
      print("break - $number");
      break; // 4보다 크면 반복문 종료
    } else if ((number % 9) != 1) {
      print("continue - $number");
      continue; // 9로 나눈 나머지가 1이 아니면 다음 반복으로 넘어감
    } else {
      print("calculate - $number");
      while (count <= 3) {
        print("$number x $count = ${number * count}");
        count++;
      }
      count = 1; // count 초기화
    }
  }

  // 구구단 짝수단 출력
  for (int dan = 2; dan <= 9; dan += 2) {
    print("$dan 단");
    for (int i = 1; i <= 9; i++) {
      print("$dan x $i = ${dan * i}");
    }
    print(""); // 단 사이에 줄바꿈
  }

  // 3x3 격자에서 X 모양 출력
  for (int i = 0; i < 3; i++) {
    String row = ''; // 각 행을 저장할 문자열
    for (int j = 0; j < 3; j++) {
      // X 모양: 양쪽 대각선 (i == j) 또는 (i + j == 2)
      if (i == j || i + j == 2) {
        // 대각선 위치
        row += 'X ';
      } else {
        row += 'O ';
      }
    }
    print(row);
    print("");
  }

  // 5x5 격자에서 X 모양 출력
  for (int i = 0; i < 5; i++) {
    String row5 = '';
    for (int j = 0; j < 5; j++) {
      if (i == j || i + j == 4) {
        row5 += "X ";
      } else {
        row5 += "O ";
      }
    }
    print(row5);
    print("");
  }

  int getMax(var argv1, var argv2) {
    if (argv1 >= argv2) {
      return argv1;
    } else {
      return argv2;
    }
  }

  // 예제 코드(코드 수정: argv2가 기본 값을 갖도록)
  int getMaxDefault(var argv2, [var argv1 = 1]) {
    if (argv1 >= argv2) {
      return argv1;
    } else {
      return argv2;
    }
  }

  // 예제 코드(코드 수정: 기본값을 갖는 매개변수)
  int getSum([int a = 0, int b = 0]) {
    return a + b;
  }

  // 예제 코드 사칙 연산 함수(빼기, 곱하기, 나누기)
  int getSubtract(int a, int b) {
    return a - b;
  }

  int getMultiply(int a, int b) {
    return a * b;
  }

  double getDivide(int a, int b) {
    if (b == 0) {
      throw Exception("0으로 나눌 수 없습니다.");
    }
    return a / b;
  }

  // 예제 코드 사칙 연산 함수 호출
  var sum = getSum(10, 20);
  print("10 + 20 = $sum");
  var subtract = getSubtract(20, 10);
  print("20 - 10 = $subtract");
  var multiply = getMultiply(10, 20);
  print("10 * 20 = $multiply");
  try {
    var divide = getDivide(20, 1);
    print("20 / 1 = $divide");
  } catch (e) {
    print("오류 발생: $e");
  }

  var number1 = getMax(1, 2);
  print(number1);

  // example
  void creatPlayer({
    required name,
    int level = 1,
    double mp = 0.0,
    String job = '백수',
  }) {
    print("플레이어 정보");
    print("플레이어 이름: $name");
    print("레벨: $level");
    print("마나: $mp");
    print("직업: $job");
    print("");
  }

  var player1 = creatPlayer(
    name: "zl존법ㅅr",
    level: 13,
    mp: 100.0,
    job: "마법사",
  ); // named parameters

  var player2 = creatPlayer(name: "나"); // named parameters, 기본값

  void printMessage(var header, var message) {
    print("[$header] $message");
  }

  // 1 ~ 50까지 정수 중에서 소수 출력(나열)
  for (int i = 2; i <= 50; i++) {
    bool isPrime = true;
    for (int j = 2; j <= i ~/ 2; j++) {
      if (i % j == 0) {
        isPrime = false;
        break;
      }
    }
    if (isPrime) {
      print(i);
    }
  }

  int iInteger = 10;
  printMessage("1-1", iInteger.abs());
  printMessage("1-2", iInteger.gcd(6));
  printMessage("1-3", iInteger.toString());
  printMessage("1-4", 2.abs());
  printMessage("1-5", 2.gcd(6));
  printMessage("1-6", 2.toString());

  double dDouble = 10.523;
  printMessage("2-1", dDouble.abs());
  printMessage("2-2", dDouble.toString());
  printMessage("2-3", dDouble.floor());
  printMessage("2-4", dDouble.round());
  printMessage("2-5", 1.8.abs());
  printMessage("2-6", 1.8.toString());
  printMessage("2-7", 1.8.floor());
  printMessage("2-8", 1.8.round());

  String sString = "Wanna Go Home";
  printMessage("3-1", sString.toLowerCase());
  printMessage("3-2", sString.toUpperCase());
  printMessage("3-3", sString.length);
  printMessage("3-4", sString.substring(0, 5));
  printMessage("3-5", sString[11]);

  bool bBoolean = true;
  printMessage("4-1", bBoolean.toString());
  printMessage("5-1", iInteger is int);
  printMessage("5-2", dDouble is double);
  printMessage("5-3", sString is String);
  printMessage("5-4", bBoolean is bool);
  printMessage("5-5", iInteger is! int);
  printMessage("5-6", dDouble is! double);
  printMessage("5-7", sString is! String);
  printMessage("5-8", bBoolean is! bool);

  var tmpS = "String";
  printMessage("5-9", tmpS is String);

  var tmpI = 123;
  printMessage("5-10", tmpI is int);
  printMessage("5-11", tmpI is String);
  printMessage("5-12", tmpI is Double);
}
