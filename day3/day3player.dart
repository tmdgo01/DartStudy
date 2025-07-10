void main() {
  var player = Player("Joe", 25);
  print(player.returnName());
  print(player.returnAge());

  player.setName("RuMira");
  player.setAge(27);

  print({player.returnName(), player.returnAge()});
}

class Player {
  late String name;
  late int age;

  Player(String givenName, int givenAge) {
    name = givenName;
    age = givenAge;
  }

  // get func
  // 반환할 자료형 함수 이름() {return 반환할 값}
  String returnName() {
    return name;
  }

  int returnAge() {
    return age;
  }

  void setName(String givenName) {
    name = givenName;
  }

  void setAge(int givenAge) {
    age = givenAge;
  }
}
