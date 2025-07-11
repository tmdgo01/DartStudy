import '../day4/day4main.dart';

void main() async {
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

  Newbox..set("찌낀빤난나");
  print(Newbox.get());

  // changecount는 왜 필요한 건지 모르겠다
  print(Newbox.totalcount);
  print(newbox.changecount);

  // 문제 1
  var shop = Shop("슬리퍼");
  shop.changeitem("운동화");
  print(shop.getsellingitem());
  shop.changeitem(100.1);
  print(shop.getsellingitem());

  print(1 + 1);

  // 동작 예약, main 함수 옆에 async 작성
  await Future.delayed(Duration(seconds: 3), () => print(" 1 home @3sec"));
  print("home");

  Future.delayed(Duration(seconds: 1), () => print(2222222));

  print((2 + 2) / 2);

  var finished = Flag(false);
  print("a");
  await dobg(5, finished);

  while (finished.activated == false) {
    await Future.delayed(Duration(seconds: 1));
  }

  var customerorder = servecustomer();
  print("수확 $customerorder");
  print("오늘 할 일 종료");
}

// 문제 1
// Shop 클래스 생성
// item 이라는 인스턴스 변수
// 여러가지 물건을 팖
// 다음의 main 함수를 정상 작동하게 만드는 generic 클래스 생성
class Shop<T> {
  late dynamic item;

  Shop(this.item); // 생성자에서 item 초기화

  void changeitem(T newItem) {
    item = newItem;
  }

  T getsellingitem() {
    return item;
  }
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

  // set을 이용하여 값이 몇 번 바뀌었는지 저장할 용도
  static late int changecount = 0;

  // 해당 클래스에서만 사용하기로 한 객체에서만 사용
  int totalcount = 0;

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
    changecount = changecount + 1;
    totalcount = totalcount + 1;
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

// dart의 기본 작업 : 동기
// 함수 내에서 await을 이용하여 비동기 프로그램을 작성할 때 async 필요

void doBackgroundJob(int jobtime) {
  if (jobtime > 0) {
    print("doBackgroundeJob : $jobtime ");
  }
}

dobg(int time, var jobend) {
  if (time > 0) {
    print("$time/s 남았습니다.");
    Future.delayed(Duration(seconds: 1), () => dobg(time - 1, jobend));
  } else {
    print("백그라운드 작업 완료");
    jobend.activated = true;
  }
}

class Flag {
  late bool _flag;

  Flag(bool gFlag) : _flag = gFlag;
  bool get activated => _flag;
  set activated(bool gflag) => _flag = gflag;
}

// java의 promiss
// async 함수 내의 값을 return 값을 반환해야 하는 경우 그 값을 Future<> 내에 작성
Future<String> servecustomer() async {
  var customerorder = await simulatecustomerorder();
  print("농작물 $customerorder 수확");

  return customerorder;
}

Future<String> simulatecustomerorder() {
  return Future.delayed(Duration(seconds: 2), () => "여름 자두");
}
