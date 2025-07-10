// O, X
// 클래스 내에서는 같은 이름을 가진 함수를 사용할 수 있다(O, 오버로딩)
// 추상 클래스는 main() 함수에서 사용할 수 있다(X)

// 주관식
// 클래스 내에서는 연산자를 함수명으로 사용해야 할 때 연산자 앞에 무엇을 작성해야 하는가?
// operator

// code 작성 1
// 사람을 뜻하는 Human 클래스를 생성,
// 이름(name), 나이, 성별을 담을 수 있는 인스턴스 변수 생성
// 모든 값들은 클래스 호출 시 필수적으로 입력
// 생성자를 작성할 때는 named parameter을 이용(106p)
// 사용자의 정보를 출력하는 함수(profile) 구현
// 출력 : [안녕하세요. 제 이름은 김철수이며, 26살 남성입니다.]

class Human {
  late String _name, _gender;
  late int _age;

  // 생성자
  Human(this._name, this._age, this._gender);

  String get name => _name;
  int get age => _age;
  String get gender => _gender;

  void profile() {
    print("[안녕하세요. 제 이름은 $name이며, $age세 $gender입니다.]");
  }
}

// code 작성 2
// 탈것이라는 뜻을 가진 Vehicle 추상 클래스에 drive 기능 추가
// 이후 Boat, Car 클래스 구현
// 각각의 클래스 별 drive 함수 실행 시
// Boat : [Boat가 물 위를 떠다닙니다.], Car : [자동차가 도로를 달립니다.]
abstract class Vehicle {
  void drive();
}

class Boat {
  void drive() {
    print("[보트가 물 위를 떠다닙니다.]");
  }
}

class Car {
  void drive() {
    print("[자동차가 도로를 달립니다.]");
  }
}

void main() {
  // 1
  Human A = Human("Georgia", 44, "여성");
  A.profile();

  Human B = Human("김철수", 26, "남성");
  B.profile();

  // 2
  var boat = Boat();
  var car = Car();
  boat.drive();
  car.drive();
}
