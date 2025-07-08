void main() {
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

  String day2 = '수요일';
  if (day2 == '월요일') {
    print('오늘은 월요일입니다.');
  } else if (day2 == '화요일') {
    print('오늘은 화요일입니다.');
  } else {
    print('오늘은 다른 요일입니다.');
  }
}
