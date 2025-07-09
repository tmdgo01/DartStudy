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
  // 두 set의 합집합 출력
  print("klist.union(setEmpty) : ${klist.union(setEmpty)}");

  // 두 set의 교집합 출력
  print("klist.intersection(klist) ${klist.intersection(klist)}");

  // klist에서 setEmpty에 없는 값만 출력
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

  // TODO: 1 ~ 10 list 생성, 첫 번째 인덱스에 9 넣기
  List<int> numList = List.generate(10, (index) => index + 1);
  numList[0] = 9;
  print("numList: $numList");

  // TODO: 6번째 인덱스에 존재하는 값이 뭔지 출력하기
  print(numList.indexOf(6));

  // TODO : "1", "2", "3"을 저장한 새로운 list 생성, numList 리스트 추가
  List<String> Slist = ["1", "2", "3"];
  Slist.addAll(numList.map((e) => e.toString()));
  print(Slist);
}
