void main() {
  var num1 = Integer(4);
  var num2 = Integer(10);
  // Integer operator 부분이 없으면 + 에 오류
  var num3 = num1 + num2;

  print(num3.get());
  print(num3);

  print(num1.mul(num2.get()));
  print(num1.div(0));
  print(num1.div(num2.get().toDouble()));

  print(num1.add(num2.get()));

  var newnum1 = nInteger();
  var newnum2 = nInteger(3);

  print("${newnum1.add(4)}, $newnum2");

  newnum1.set(9);
  newnum1.changeInteger = 2;
  print(newnum1);

  newnum1.set(10);
  print(newnum1.getOld());
  print(newnum1.asString);

  newnum1.set(2);
  newnum1.set(4);

  newnum1.activated = false;
  newnum1.set(1);
  newnum1.set(6);

  // 추상 클래스
  var circle = Circle(10);
  var square = Square(10, 20);
  // 추상 클래스는 실체를 가질 수 없음
  // 오류 : var rect = Rectangle();

  circle.draw();
  square.draw();
}

class Integer {
  late int _val;
  // 생성자 type1
  // Integer([int givenValue = 0]) {
  //   _val = givenValue;
  // }

  // 생성자 type2
  Integer([int givenVal = 0]) : _val = givenVal {}

  // 인스턴스 변수를 반환하기 위한 함수
  int get() => _val;
  void set(int getVal) => _val = getVal;

  // get, set을 계속 작성하기 너무 번거로움 > 정리해서 getter, setter
  // getter 사용법
  // 반환할 자료 타입 get 함수명 => 반환할 값
  // String get returning => "$_val";
  // 인스턴스 변수 _val

  // setter 사용법
  // void set 함수명 => 변경할 값;
  void set changeNumber(int given) => _val = given;

  String get asString => "$_val";
  int get asInt => _val;

  set val(int givenNumber) => _val = givenNumber;

  set changeInteger(int givenNumber) => _val = givenNumber;

  // givenVal = integer value
  // overloading 사용법 = 기존에 있는 클래스에 추가적인 함수를 만들어서 클래스를 강화
  // 자료형 함수명(사용자 입력 값){실제 동작}
  Integer operator +(Integer givenVal) {
    print('Integer class +');
    return Integer(_val + givenVal.get());
    // = return Integer(_val _ givenVal._val);

    // var result = _val + givenVal.get();
    // var result2 = Integer(result);
    // return result2;
  }

  int add(int givenVal) {
    return _val + givenVal;
    // var result = _val * givenVal.get();
    // var result2
    // return reslut2
  }

  int sub(int givenVal) {
    return _val - givenVal;
  }

  int mul(int givenVal) {
    return _val * givenVal;
  }

  double div(double givenVal) {
    if (givenVal == 0) {
      print("Cant divid 0");
    }
    return _val / givenVal;
  }

  // String get asString => "$_val";
}

// class newInteger extends(다음으로 적힐 클래스에 있는 정보 포함)
class nInteger extends Integer with ActivationFlag {
  List<int> _list = [];
  nInteger([int givenVal = 0]) {
    _val = givenVal;
  }

  @override // Integer class + a
  void set(int givenVal) {
    _list.add(_val);
    // super : class 생성 시 extends 뒤에 쓴 class
    super.set(givenVal);
    if (activated == true) {
      _list.add(_val);
      print("set func 실행, 현재 저장 결과 $_list");
    } else {
      print("set func 실행하지 않음");
    }
  }

  @override
  String toString() {
    return "$_val";
  }

  String get asString => "현재 값 $_val, 기존 값 $_list";

  List getOld() {
    return _list;
  }
}

mixin ActivationFlag on Integer {
  bool _flag = true;
  bool get activated => _flag;
  set activated(bool givenFlag) => (_flag = givenFlag);
}

// abstract(추상 클래스) : 객체를 만들 수 없음
// 여러 클래스가 공통적으로 가지고 있는 기능이지만
// 각 클래스마다 작동하는 부분이 조금씩 다를 경우
// '이런 기능이 있다'라고 작성
abstract class Rectangle {
  int cx = 0, cy = 0;
  void draw();
}

class Square implements Rectangle {
  late int rkfh, tpfh;

  @override
  int cx = 0, cy = 0;
  late int radius;

  @override
  void draw() {
    print("$rkfh x $tpfh draw Square");
  }

  Square([int givenrkfh = 7, giventpfh = 7])
    : rkfh = givenrkfh,
      tpfh = giventpfh;
}

class Circle implements Rectangle {
  @override
  int cx = 0, cy = 0;
  late int radius;

  @override
  void draw() {
    print("radius : $radius인 원을 그린다.");
  }

  Circle([int givenRadius = 1]) {
    radius = givenRadius;
  }
}
