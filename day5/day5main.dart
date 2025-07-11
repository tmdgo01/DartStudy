void main() {
  // List<int> list = [2, 3];

  // var backpack = bag(["watch", 10]);

  // print(backpack.pick(["watch", 1]));

  // var box = Box("clock");
  // var box2 = Box(1000);
  // var box3 = Box(1.1);

  // box.getValue();
  // box2.getValue();
  // box3.getValue();

  var intbox = Box(1);
  var Stringbox = stringbox("과일");

  var Newbox = newbox("home");

  print(Newbox.get());
  Newbox.set("집");
  print(Newbox.get());
}

// <T> 사용자가 여러 Type을 사용할 수 있도록
// 하나의 클래스에서 여러 개의 자료형을 관리해야 할 때
// class 클래스명<T>{
// T 인스턴스 변수명;}
class bag<T> {
  late List list;

  bag(List glist) {
    list = glist;
  }

  T pick(List<T> item) {
    // item [0] = watch, [1] = 1000
    print(item[0].runtimeType);

    return item[0];
  }
}

// 타입 변경에 의해 새로운 클래스를 생성하게 되면
// 똑같은 기능을 하는 클래스가 여러 개
// 이 경우 한 클래스에 작성하기 위해 Generic 사용

// <>는 사용자 설정
class newbox<H> {
  late dynamic item;

  // 사용자가 입력한 gvalue의 자료형을 따라감
  // 사용자가 숫자를 입력하면 -> int
  newbox(H gvalue) {
    item = gvalue;
  }

  dynamic get() {
    return item;
  }

  void set(dynamic nitem) {
    item = nitem;
  }
}

class Box {
  // T value;
  // Box(T gvalue) : value = gvalue;

  // T getValue() {
  // print(value.runtimeType);
  // return value;

  late int item;

  Box(int gitem) : item = gitem;

  int get() {
    return item;
  }

  void set(int nitem) {
    item = nitem;
  }
}

class stringbox {
  late String item;

  stringbox(String gitem) : item = gitem;

  String get() {
    return item;
  }

  void set(String nitem) {
    item = nitem;
  }
}
