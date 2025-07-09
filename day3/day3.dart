void main() {
  // TODO : 1 ~ 100까지의 숫자 중 짝수에 해당하는 수만 List에 담아서 출력
  List<int> evenNumbers = [
    for (int i = 1; i <= 100; i++)
      if (i % 2 == 0) i,
  ];
  print(evenNumbers);

  // Player Class를 사용한 print
  Player player = Player("Joe", 25);
  print("name: ${player.name}, age: ${player.age}");

  player.name = "Rumira";
  player.age = 22;
  print("setter name: ${player.name}, setter age: ${player.age}");

  // TODO : Map을 이용하여 생선 가게에 다음과 같은 생선들이 존재하도록 코드 작성
  // {"도미": 5, "참치": 3, "연어": 7, "광어": 13}
  // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  // TODO : Player 클래스 - 생선을 구매할 수 있음
  // {"도미": 1, "참치": 2, "연어": 3, "광어": 14}를 구매함
  // 생선을 구매하는 함수(buy) 구현
  // 생선을 구매할 수 있는 Player class, 구매할 경우 fishdb 내의 생선 수가 줄어 든다
  // Class를 사용하여 사용자 가방 Map(backpack) 생성, 구매할 경우 생선 수가 늘어남
  // 생선 가게의 생선 수가 0 이하일 경우, [구매할 수 있는 생선이 없습니다.] 출력
  // 사용자의 가방과 생선 가게의 생선 수를 확인할 수 있는 기능 구현(함수)

  // 생선 정보 저장
  Map<String, int> fishdb = {"도미": 5, "참치": 3, "연어": 7, "광어": 13};
  FishStore store = FishStore(fishdb); // FishStore에서 사용할 값(fishdb)
  store.printFishStock(); // 생선 가게 재고 출력

  // 구매 예시
  Map<String, int> order = {"도미": 2, "참치": 3, "연어": 3, "광어": 14};
  player.buy(order, store);

  player.printBackpack();
  store.printFishStock();
}

// TODO : name과 age를 입력받을 수 있는 Player Class를 만들고
// 해당 플레이어의 이름, 나이를 확인할 수 있는 getter 함수와 해당 내역을 수정할 수 있는 setter 함수 작성
class Player {
  // 인스턴스 변수로 name, age를 선언
  late String _name;
  late int _age;

  // 생성자
  Player(this._name, this._age);

  // 이름 getter
  String get name => _name;

  // 나이 getter
  int get age => _age;

  // 이름 setter
  set name(String name) => _name = name;

  // 나이 setter
  set age(int age) => _age = age;

  Map<String, int> backpack = {};

  // 플레이어 가방 내역 확인
  void printBackpack() {
    print("$name's backpack : $backpack");
  }

  // 생선 구매 함수
  void buy(Map<String, int> order, FishStore store) {
    for (var fish in order.keys) {
      int want = order[fish] ?? 0;
      int stock = store.fishdb[fish] ?? 0;
      if (stock < want || stock <= 0) {
        print("구매할 수 있는 생선이 없습니다. ($fish)");
        continue;
      }
      // 가게 재고 차감
      store.fishdb[fish] = stock - want;
      // 가방에 추가
      backpack[fish] = (backpack[fish] ?? 0) + want;
      print("$name이(가) $fish $want개를 구매했습니다.");
    }
  }
}

class FishStore {
  Map<String, int> fishdb;

  FishStore(this.fishdb);

  // 생선 가게의 생선 수 확인
  void printFishStock() {
    print("생선 가게 재고: $fishdb");
    // if 생선 가게의 재고를 넘어가게 구매하면 최대 수량까지만 구매 가능
    for (var entry in fishdb.entries) {
      if (entry.value < 0) {
        fishdb[entry.key] = 0;
        print("[${entry.key}]를 더 이상 구매할 수 없습니다.");
      }
    }
  }
}
