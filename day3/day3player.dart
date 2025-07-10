void main() {
  var player = Player("Joe", 25);
  print(player.returnName());
  print(player.returnAge());

  player.setName("RuMira");
  player.setAge(27);

  print("수정 후: ${player.returnName()}, ${player.returnAge()}");

  // getter 사용
  print("getter name: ${player.getterName}");
  print("getter age: ${player.getterAge}");

  // setter 사용
  player.setterName = "Mira";
  player.setterAge = 30;

  print("setter 적용 후: ${player.getterName}, ${player.getterAge}");
}

class Player {
  late String name;
  late int age;

  Player(String givenName, [int givenAge = 1]) {
    name = givenName;
    age = givenAge;
  }

  String returnName() => name;
  int returnAge() => age;

  void setName(String givenName) => name = givenName;
  void setAge(int givenAge) => age = givenAge;

  String get getterName => name;
  int get getterAge => age;

  set setterName(String givenName) => name = givenName;
  set setterAge(int givenAge) => age = givenAge;
}
