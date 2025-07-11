import 'dart:vmservice_io';

//////////////////////////////////////////////
// 1
// 상점을 뜻하는 Shop 제네릭 클래스를 구현하고, 비어있는 부분을 작성해 코드를 완성하세요.
class Shop<T> {
  late dynamic item;

  Shop(this.item);

  dynamic get() {
    return item;
  }
}

void main() async {
  var stringShop = Shop("나시"); // 문자열만 다룰 수 있어야 함.
  var doubleShop = Shop("1.1"); // 실수만 다룰 수 있어야 함.

  print(stringShop.get()); // [나시] 를 출력해야 함.
  print(doubleShop.get()); // [1.1] 을 출력해야 함.

  //////////////////////////////////////////////////////////////
  // 2
  print("A");
  await doSomething();
  print("C");

  /////////////////////////////////////////////////////////////
  // 3
  var num = 10;

  try {
    if (num is! String) {
      throw NoStringException();
    }
  } catch (e) {
    print(e);
  }
}

// 다음 코드가 순차적으로 A, B, C 를 출력해야 한다고 가정했을 때,
// 비어있는 부분을 작성해 코드를 완성하세요.
Future<String> doSomething() async {
  await Future.delayed(Duration(seconds: 1));
  print("B");
  return "B";
}

///////////////////////////////////////////////////////////
// 3
// NoStringException 이라는 에러 클래스를 생성한 후,
// main 함수에 num 이라는 변수에 10 을 넣어주세요.
// 이후 num의 타입이 string 이 아닐 경우,
// NoStringException 클래스를 통해 다음의 내용이 출력되게 구현하세요.
// [해당 값은 문자열이 아닙니다.]

class NoStringException {
  final String message;
  NoStringException([this.message = "[해당 값은 문자열이 아닙니다.]"]);

  @override
  String toString() => message;
}
