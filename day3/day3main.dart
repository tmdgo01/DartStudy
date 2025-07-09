void main() {
  // List 예제
  List list = [1, 2, 3, 4, 5];
  print(list);
  print(list.last);
  print(list.first);
  print(list.indexOf(1));

  list.add(7);
  list.addAll([8, 9, 10]);
  list.insert(0, 0);
  print(list);

  list.sort(); // 오름차순 정렬

  list.clear();

  print("list $list");

  List list2 = [1, 2, 3, 4, 5];

  for (int i = 0; i <= 4; i++) {
    print(" List2 ${list2[i]}");
  }

  for (var item in list2) {
    print(item);
  }

  // 141p 2. 예제 코드 수정하기
  List ilist = [1, 2, 3, 4, 5];
  List mixedList = [1, 2.2, 'Three'];
  ilist = mixedList;
  print(ilist);

  List jlist = [2, 2, 3, 3, 3];
  mixedList = jlist;
  print(mixedList);

  // 3. 추가 기능 작성하기
  // 내림차순 정렬
  jlist.sort((a, b) => b.compareTo(a)); // b가 a보다 크면 앞으로 오게
  print("내림차순 jlist: $jlist");

  // set : 중괄호 선언, 중복된 값을 담을 수 없음
  Set klist = {1, 2};
  Set setEmpty = {};

  print("klist : $klist");
  print("setEmpty : $setEmpty");

  klist.add(3);
  print("add 3 klist $klist");

  setEmpty.addAll([3, 4, 5]);
  print("setEmpty addAll $setEmpty");

  print("3 in klist ${klist.contains(3)}"); // 포함된 숫자가 있는지 bool type
  print("5 in klist ${klist.contains(5)}");
  // 합집합
  print("klist.union(setEmpty) : ${klist.union(setEmpty)}");

  // 교집합
  print("klist.intersection(klist) ${klist.intersection(klist)}");

  // 차집합
  print("klist.difference(setEmpty) ${klist.difference(setEmpty)}");

  print("klist.intersection(klist) ${klist.intersection(klist)}");

  print("klist.difference(setEmpty) ${klist.difference(setEmpty)}");

  klist.remove(3);
  print("klist.remove(3) : $klist");

  Set<int> exset1 = {1, 2, 3};
  var exset2 = <int>{};

  print("exset1 : $exset1");
  print("exset2 : $exset2");

  print("klist.runtimeType : ${klist.runtimeType}");
  print("setEmpty.runtimeType : ${setEmpty.runtimeType}");
  print("exset1.runtimeType : ${exset1.runtimeType}");
  print("exset2.runtimeType : ${exset2.runtimeType}");

  Set<dynamic> mixedSet = {1, 2.5, 'hello', 3, 'world'};
  print("mixedSet : $mixedSet");

  mixedSet.add(4.2);
  mixedSet.add('dart');
  print("mixedSet after add : $mixedSet");

  print("mixedSet contains 'hello': ${mixedSet.contains('hello')}");
  print("mixedSet contains 2.5: ${mixedSet.contains(2.5)}");

  mixedSet.remove('world');
  print("mixedSet after remove 'world': $mixedSet");

  // Map
  Map dbFruit = {"A001": "Apple", "A002": "Mango"};
  var dbEmpty = <dynamic, dynamic>{};
  print("dbFruit : $dbFruit");
  print("dbEmpty : $dbEmpty");

  dbFruit["A003"] = "Orange";
  print("dbFruit.containsKey(A002) ${dbFruit.containsKey("A002")}");
  print("dbFruit.containsValue(Kiwi) ${dbFruit.containsValue("Kiwi")}");

  dbFruit.remove("A002");
  print("dbFruit.remove(A002) $dbFruit");

  dbEmpty.clear();
  print("dbEmpty.clear $dbEmpty");

  // 3. 추가 기능 작성하기 1
  int count = 1;
  dbFruit.forEach((key, value) {
    dbFruit[key] = count.toString();
    count++;
  });
  print("dbFruit after value change: $dbFruit");

  // TODO : 1 ~ 10 list 생성, 첫 번째 인덱스에 9 넣기
  List<int> numList = List.generate(10, (index) => index + 1);
  numList[0] = 9;
  print("numList: $numList");

  // TODO : 6번째 인덱스에 존재하는 값이 뭔지 출력하기
  print(numList.indexOf(6));

  // TODO : "1", "2", "3"을 저장한 새로운 list 생성, numList 리스트 추가
  List<String> Slist = ["1", "2", "3"];
  Slist.addAll(numList.map((e) => e.toString()));
  print(Slist);

  // TODO : 문자열 "가" ~ "사"를 포함한 Set 생성,
  // "라" ~ "하"를 포함한 Set 추가 생성,
  // 두 Set을 포함한 새로운 Set 생성
  Set<String> set1 = {"가", "나", "다", "라", "마", "바", "사"};
  Set<String> set2 = {"라", "마", "바", "사", "아", "자", "차", "카", "타", "파", "하"};
  Set<String> combinedSet = {...set1, ...set2};
  print("set1: $set1");
  print("set2: $set2");
  print("combinedSet: $combinedSet");
  //   set1.addAll(set2);
  //   print(set1);

  // TODO : Set 심화 과정 - 두 개의 세트에서 합집합, 교집합, 차집합 순서로 새로운 세트 출력
  print("set1.union(set2) : ${set1.union(set2)}");
  print("set1.intersection(set2) : ${set1.intersection(set2)}");
  print("set1.difference(set2) : ${set1.difference(set2)}");

  // TODO : 과일 상점을 뜻하는 shop 변수에
  // apple은 10개, banana는 5개, mango는 3개가 존재하도록 Map을 생성한 뒤,
  // 이 상점에서 망고를 판매하고 있는지 확인하고 판매하고 있다면
  // [이 상점에서는 망고를 $count개 판매하고 있습니다.] 출력
  Map<String, int> shopdb = {"apple": 10, "banana": 5, "mango": 3};
  if (shopdb.containsKey("mango")) {
    // int count = 0;
    // count = shopdb["mango"];
    print("이 상점에서는 망고를 ${shopdb["mango"]}개 판매하고 있습니다.");
  }
  shopdb["mango"] = (shopdb["mango"] ?? 0) - 2;
  print(shopdb);

  // 유니코드
  print("\u{AC00}");

  Map dicEmoji = {
    "A": "\u{0041}",
    "a": "\u{0061}",
    "clap": "\u{1f44f}",
    "smile": "\u{1F642}",
    "star": "\u{2605}",
  };
  print(dicEmoji);

  List qlist = [];
  qlist
    ..addAll([2, 1])
    ..add(0)
    ..sort((a, b) => a.compareTo(b));
  print(qlist);
  qlist.forEach((item) => {printStar(item)});

  qlist.forEach(printStar);
  // 중첩 함수
  void yo() {
    print("yo");
  }

  yo();

  void smile(var item) {
    print("\u{1f642} $item \u{1f642}");
  }

  smile(111);

  List tlist = [1, 2, 3];
  if (tlist.isEmpty) {
    smile("Empty list");
  } else {
    smile("no Empty list");
    yo();
  }
  tlist.isEmpty ? smile("Empty list") : smile("no Empty list");
  tlist.first == 1 ? smile("첫 번째 = 1") : smile("첫 번째 != 1");

  // 조건적 표현
  // A ? B : C
  // A 조건을 만족하면 B, 아니면 C

  // 16 진수
  num var1 = 0x01;
  num var2 = 0xff;
  print("$var1, $var2");

  num vari = int.parse('1');
  num vard = double.parse('1.1');
  print("$vari, $vard");

  print(Color.values);
  Color color = Color.red;
  print(color);

  int temp = 3;
  int? nulltemp;
  print(temp);
  print(nulltemp);

  var innt = Integer();
  var inntt = Integer(3);
  print("innt.value ${innt._value}");
  print(inntt._value);
}

void printStar(var item) {
  print("\u{2605} $item \u{2605}");
}

// 나열형 데이터
enum Color { red, green, blue }

enum City { Gwangju, Busan, Yongin }

// 생성자
class Integer {
  late int _value;
  Integer([int givenValue = 0]) {
    _value = givenValue;
  }
}

class TimemachineInteger extends Integer {}
