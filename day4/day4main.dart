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
}

class Integer {
  late int _val;
  Integer([int givenValue = 0]) {
    _val = givenValue;
  }
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
}
