void main() {
  String name = "123";
  print(3);

  print(name);

  dynamic variable = 10;

  variable = "Hello, Dart!";

  print(variable);

  const pi = 3.14; // 선언 시점에 값이 있어야 함
  print(pi);

  const ma = 'www.naver.com';
  print(ma);

  var dlfma;
  dlfma = "tmdgo";

  print("hi im $dlfma ~");

  // const Case
  const double cMathPi = 3.14159265358979323846;
  const cChangeRate = 1.3;
  print("$cMathPi, $cChangeRate");

  final String fFirstFuruit = "Apple"; // 선언 시점에 값이 없어도 됨, 값 변경 불가능
  final String fSecondFruit = "Banana";
  print("$fFirstFuruit sagwa $fSecondFruit Bbananna");

  var A = 10;
  var B = 20;
  var C = A * B;

  const x = 'X';
  const nun = '=';

  print("$A X $B = $C");
  print("$A $x $B $nun $C");

  // todo: num1, mum2 변수를 선언
  // 각각의 값을 더하고, 빼고, 나누고, 곱한 값을 print

  num num1 = 15;
  num num2 = 5;

  print(num1 + num2);
  print(num1 - num2);
  print(num1 / num2);
  print(num1 * num2);
  print(num1 ~/ num2); // 정수 나눗셈
  print(num1 % num2); // 나머지 연산
  print(num1++); // 후위 증가 연산자
  print(++num1); // 전위 증가 연산자
  print(num1--); // 후위 감소 연산자
  print(--num1); // 전위 감소 연산자

  int a = 1;

  print(a++); // 후위 증가 연산자
  print(++a); // 전위 증가 연산자

  num number1, number2;
  num tmp1, tmp2, tmp3, tmp4, tmp5, tmp6;

  number1 = 3;
  number2 = 2;

  tmp1 = number1 + number2;
  tmp2 = number1 - number2;
  tmp3 = number1 * number2;
  tmp4 = number1 / number2;
  tmp5 = number1 ~/ number2; // 정수 나눗셈
  tmp6 = number1 % number2; // 나머지 연산

  print('[1] $tmp1 $tmp2 $tmp3 $tmp4 $tmp5 $tmp6');

  number1 = 3.0;
  number2 = 2;

  tmp1 = number1 + number2;
  tmp2 = number1 - number2;
  tmp3 = number1 * number2;
  tmp4 = number1 / number2;
  tmp5 = number1 ~/ number2; // 정수 나눗셈
  tmp6 = number1 % number2; // 나머지 연산
  print('[2] $tmp1 $tmp2 $tmp3 $tmp4 $tmp5 $tmp6');

  number1 = 3;
  number2 = 3;

  num number3, number4;

  number3 = ++number1 + 1;
  number4 = number2++ + 1;
  print('[3] $number3 $number4');

  number3 = --number1 + 1;
  number4 = number2-- + 1;
  print('[4] $number3 $number4');

  number1 += 1;
  print('[5] $number1');

  number1 -= 1;
  print('[6] $number1');

  number1 *= 2;
  print('[7] $number1');

  number1 = 6;
  number1 ~/= 2;
  print('[8] $number1');

  number1 = 7;
  number1 %= 2;
  print('[9] $number1');

  // ex 2
  var aa = 17;
  var bb = 29;
  var cc = 31;
  print(aa * bb + cc / 2);

  var longStr3 =
      "molva "
      "imma "
      "nun "
      "ggal A.";
  print(longStr3);

  // chapter5 문자 자세히 다루기
  var str1 = 'Single quotes';
  var str2 = "Double quotes";
  var str3 = '"Double quotes" in Single quotes';
  var str4 = "'Single quotes' in Double quotes";
  var str5 = '\'Escape Delimiter\' in Single quotes';
  print("[1]\n$str1\n$str2\n$str3\n$str4\n$str5");

  double aade = 3.14;
  aade.toString();

  var longStr4 =
      "야호 "
      "야야호 "
      "야야야호"
      "야야야야호";
  print(longStr4);

  num dan2 = 2;

  print("$dan2 X 1 = ${dan2 * 1}");
  print("$dan2 X 2 = ${dan2 * 2}");
  print("$dan2 X 3 = ${dan2 * 3}");
  print("$dan2 X 4 = ${dan2 * 4}");
  print("$dan2 X 5 = ${dan2 * 5}");
  print("$dan2 X 6 = ${dan2 * 6}");
  print("$dan2 X 7 = ${dan2 * 7}");
  print("$dan2 X 8 = ${dan2 * 8}");
  print("$dan2 X 9 = ${dan2 * 9}");

  String result = ''; // 구구단 결과를 누적할 문자열 변수

  for (int i = 1; i <= 9; i++) {
    // 1부터 9까지 반복
    for (int j = 1; j <= 9; j++) {
      // 각 단의 1부터 9까지 곱셈
      result += '${i} * ${j} = ${i * j}\n'; // 결과를 문자열에 누적
    }
    result += '\n'; // 각 단 사이에 공백 한 줄 추가
  }

  // 최종 결과 출력
  print(result);
}
