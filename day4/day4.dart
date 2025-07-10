void main() {
  // code result test
  var test1 = gInteger(11);
  var test2 = gInteger(13);

  test1.set(1);
  test2.set(3);
  print(test1.get());
  test1.set(5);
  print(test1);
  print("$test1, $test2");
}

// Integer class 생성 후 인스턴스 변수 생성(val), 생성자는 203p 방법을 이용
class Integer {
  late int val;

  Integer([int givenval = 0]) : val = givenval {}

  // Integer class는 인스턴스 변수를 return하는 get func, 값 변경하는 set func 포함
  int get() => val;

  void set(int getval) => val = getval;
  void set changenumber(int given) => val = given;

  String get asString => "$val";
  int get asInt => val;

  set value(int givenNumber) => val = givenNumber;

  set changeInteger(int givenNumber) => val = givenNumber;
}

// Integer class를 extends하는 gInteger 클래스 생성
class gInteger extends Integer {
  // gInteger class에 glist라는 list형 인스턴스 변수 생성
  List<int> glist = [];
  gInteger([int givenval = 0]) {
    val = givenval;
  }

  // Integer class에 존재하는 set func을 @override하고 값이 변경될 때마다 glist에 변경된 값을 저장하는 func
  @override
  void set(int userinput) {
    glist.add(val);
    super.set(userinput);
  }

  @override
  String toString() {
    return "$val";
  }

  // glist 값을 return하는 func
  List rlist() {
    return glist;
  }
}
