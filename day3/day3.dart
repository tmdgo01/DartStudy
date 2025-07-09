void main() {
  // TODO : 1 ~ 100까지의 숫자 중 짝수에 해당하는 수만 List에 담아서 출력
  List<int> evenNumbers = [
    for (int i = 1; i <= 100; i++)
      if (i % 2 == 0) i,
  ];
  print(evenNumbers);

  // TODO : Map을 이용하여 생선 가게에 다음과 같은 생선들이 존재하도록 코드 작성
  // {"도미": 5, "참치": 3, "연어": 7, "광어": 13}
  Map fishdb = {"도미": 5, "참치": 3, "연어": 7, "광어": 13};
  print(fishdb);

  // Player Class를 사용한 예제 print 코드 작성
  Player player = Player("Joe", 25);
  print("이름: ${player.name}, 나이: ${player.age}");

  player.name = "Rumi";
  player.age = 22;
  print("setter name: ${player.name}, setter age: ${player.age}");
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
}
