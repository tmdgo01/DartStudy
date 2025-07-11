Future<String> hello() async {
  // 5초 후에 "hello"를 반환
  await Future.delayed(Duration(seconds: 5));
  print("hello");

  return "hello";
}

void main() async {
  // 1. 10초 후에 메시지 출력
  print("yo");
  await Future.delayed(Duration(seconds: 10), () => print("10sec after"));
  print("yo");

  // 2. hello 함수 실행 후 완료되었을 때 메시지 출력
  await hello(); // 5초 기다린 후 "hello" 출력
  print("hello 출력");
}
