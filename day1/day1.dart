void main() {
  // 1
  final int num1 = 11;
  // const int num2 = 22;
  print("num1 = $num1");

  //2
  double pi = 3.14;
  num half = 7;
  print(2 * half * pi);

  //3
  int rkfh = 5;
  int tpfh = 7;
  print(rkfh * tpfh);

  //4
  int adult = 5000;
  int child = 3000;
  int adult_total_price = adult * 2;
  int child_total_price = child * 1;
  int total_price = adult_total_price + child_total_price;
  int pay_price = 15000;
  int change = pay_price - total_price;

  print("비엔날레 입장권 영수증");
  print("성인(2명): $adult_total_price원");
  print("어린이(1명): $child_total_price원");

  print("총 결제 금액: $total_price원");
  print("지불 금액: $pay_price원");
  print("거스름돈: $change원");
}
