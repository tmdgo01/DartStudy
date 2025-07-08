void main() {
  // 1. 시험 점수는 score, 등급은 grade, 철수는 70점
  // 91~100: A, 81~90: B, 71~80: C, 61~70: D, 51~60: E, 그 외 : F
  // if-else 문을 이용하여 출력
  int score = 70;
  String grade;
  if (score >= 91 && score <= 100) {
    grade = 'A';
  } else if (score >= 81 && score <= 90) {
    grade = 'B';
  } else if (score >= 71 && score <= 80) {
    grade = 'C';
  } else if (score >= 61 && score <= 70) {
    grade = 'D';
  } else if (score >= 51 && score <= 60) {
    grade = 'E';
  } else {
    grade = 'F';
  }
  print("[철수의 시험 점수는 $score점이며, 등급은 $grade입니다.]");

  // 2. 키 176, 몸무게 63 영재의 BMI 계산, 점수에 따른 기준표
  // BMI = 몸무게(kg) / (키(m) * 키(m))
  // 18.5 미만: 저체중, 18.5 ~ 22.9: 정상, 23 ~ 24.9: 과체중, 25.0 ~ : 비만
  double height = 176 / 100; // cm를 m로 변환
  double weight = 63;
  double bmi = weight / (height * height);
  String status;
  if (bmi < 18.5) {
    status = '저체중';
  } else if (bmi >= 18.5 && bmi <= 22.9) {
    status = '정상';
  } else if (bmi >= 23 && bmi <= 24.9) {
    status = '과체중';
  } else {
    status = '비만';
  }
  // dart double 소수점 둘째 자리까지 출력하기
  String bmiFormatted = bmi.toStringAsFixed(2);
  print("[영재의 BMI 점수는 ${bmiFormatted}이며, $status입니다.]");

  // 3. 사용자 이름, 번호, 나이 출력
  // 양식 : [제 이름은 $name, 번호는 $phone이며, 나이는 $age입니다.]
  // 나이는 필수 입력이 아니며, 나이를 입력하지 않은 경우를 '비공개'로 처리
  String name = "짱구";
  String phone = "010-0000-0000";
  int? age;
  // int?는 age가 null일 수 있음을 의미
  // age가 null인 경우 '비공개'로 처리
  String ageDisplay = age != null ? age.toString() : '비공개';
  print("[제 이름은 $name, 번호는 $phone이며, 나이는 $ageDisplay입니다.]");

  // 주희는 영수와 369 게임을 하기로 했습니다. 1 ~ 40까지의 정수 중 '3'이 포함된 숫자가 있을 경우 '짝' 출력, 아닌 경울 숫자를 출력하는 for문, while문 코드 작성
  for (int i = 1; i <= 40; i++) {
    // 3, 6, 9가 포함된 숫자
    // if (i.toString().contains('3') || i.toString().contains('6') || i.toString().contains('9')) {
    if (i.toString().contains('3')) {
      print('짝');
    } else {
      print(i);
    }
  }
}
