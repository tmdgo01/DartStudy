import 'dart:convert';
import 'dart:io';
import 'dart:math';

void main() async {
  // Q1
  // dart 표준 라이브러리 사이트 https://api.dart.dev/dart-math/ 를 참고하여
  // 1 ~ 10 까지의 숫자 중 랜덤한 숫자를 A 와 B 라고 선언된 두 변수에 담고
  // 두 변수 중 더 큰 숫자를 반환하는 프로그램을 구현하세요.
  // Run 실행 시 실행 결과는 다음과 같이 작동해야 합니다.
  // A가 더 클 경우: [A가 5, B가 3 이므로, A가 더 큽니다.]
  // A와 B가 같은 경우: [A가 3, B가 3 이므로, 두 숫자가 동일합니다.]
  // B가 더 클 경우: [A가 2, B가 7 이므로, B가 더 큽니다.]
  int A, B;
  A = Random().nextInt(10) + 1; // 1 ~ 10
  B = Random().nextInt(10) + 1; // 1 ~ 10
  if (A > B) {
    print("A가 $A, B가 $B 이므로, A가 더 큽니다.");
  } else if (A < B) {
    print("A가 $A, B가 $B 이므로, B가 더 큽니다.");
  } else {
    print("A가 $A, B가 $B 이므로, 두 숫자가 동일합니다.");
  }

  // Q2
  // localhost:8080 으로 접근할 수 있는 서버를 생성하고,
  // 크롬 검색창에서 localhost:8080/capital=Korea 과 같이 입력했을 때,
  // 다음과 같이 출력이 되는 기능을 만드세요.
  // [Korea의 수도는 Seoul 입니다.]
  // 단, 수도가 입력되지 않은 경우는 다음과 같이 출력되어야 합니다.
  // [유효하지 않은 수도를 입력하셨습니다.]
  // localhost:8080/all 를 입력하면 가지고 있는 나라와 수도를 모두 출력
  // localhost:8080/delete?country=Korea 를 입력하면 해당 나라를 삭제
  // 삭제 후 남아있는 데이터 JSON 반환
  // localhost:8080/push?country=Korea&capital=Seoul 를 입력하면 해당 나라와 수도를 추가
  // localhost:8080/update?country=Korea&capital=Seoul 를 입력하면 해당 나라의 수도를 수정
  final capital = <String, String>{
    'Korea': 'Seoul',
    'USA': 'Washington D.C.',
    'Japan': 'Tokyo',
    'China': 'Beijing',
    'France': 'Paris',
    'Germany': 'Berlin',
    'Italy': 'Rome',
  };

  final server = await HttpServer.bind(InternetAddress.loopbackIPv4, 8080);
  print('Listening on http://${server.address.host}:${server.port}');

  await for (HttpRequest request in server) {
    final method = request.method;
    final path = request.uri.path;

    try {
      if (method == 'GET') {
        final path = request.uri.path;

        if (path.startsWith('/capital=')) {
          final country = Uri.decodeComponent(
            path.substring('/capital='.length),
          );
          if (capital.containsKey(country)) {
            final content = "$country의 수도는 ${capital[country]} 입니다.";
            request.response
              ..statusCode = HttpStatus.ok
              ..headers.contentType = ContentType.text
              ..write(content);
          } else {
            request.response
              ..statusCode = HttpStatus.notFound
              ..headers.contentType = ContentType.text
              ..write("유효하지 않은 수도를 입력하셨습니다.");
          }
        } else if (path == '/all') {
          request.response
            ..statusCode = HttpStatus.ok
            ..headers.contentType = ContentType.json
            ..write(jsonEncode(capital));
        } else if (path == '/delete') {
          final country = request.uri.queryParameters['country'];
          if (country != null && capital.containsKey(country)) {
            capital.remove(country);
            request.response
              ..statusCode = HttpStatus.ok
              ..headers.contentType = ContentType.json
              ..write(jsonEncode(capital));
          } else {
            request.response
              ..statusCode = HttpStatus.notFound
              ..headers.contentType = ContentType.text
              ..write("삭제할 나라를 찾을 수 없습니다.");
          }
        } else if (path == '/push') {
          final country = request.uri.queryParameters['country'];
          final capitalCity = request.uri.queryParameters['capital'];
          if (country != null && capitalCity != null) {
            capital[country] = capitalCity;
            request.response
              ..statusCode = HttpStatus.ok
              ..headers.contentType = ContentType.json
              ..write(jsonEncode(capital));
          } else {
            request.response
              ..statusCode = HttpStatus.badRequest
              ..headers.contentType = ContentType.text
              ..write("잘못된 요청입니다. country와 capital을 모두 입력해주세요.");
          }
        } else if (path == '/update') {
          final country = request.uri.queryParameters['country'];
          final capitalCity = request.uri.queryParameters['capital'];
          if (country != null && capitalCity != null) {
            if (capital.containsKey(country)) {
              capital[country] = capitalCity;
              request.response
                ..statusCode = HttpStatus.ok
                ..headers.contentType = ContentType.json
                ..write(jsonEncode(capital));
            } else {
              request.response
                ..statusCode = HttpStatus.notFound
                ..headers.contentType = ContentType.text
                ..write("수정할 나라를 찾을 수 없습니다.");
            }
          } else {
            request.response
              ..statusCode = HttpStatus.badRequest
              ..headers.contentType = ContentType.text
              ..write("잘못된 요청입니다. country와 capital을 모두 입력해주세요.");
          }
        } else {
          request.response
            ..statusCode = HttpStatus.badRequest
            ..headers.contentType = ContentType.text
            ..write("잘못된 요청입니다.");
        }
      } else if (method == 'DELETE') {}
    } catch (e) {
      print('Error: $e');
      request.response
        ..statusCode = HttpStatus.internalServerError
        ..headers.contentType = ContentType.text
        ..write("서버 내부 오류가 발생했습니다.");
    } finally {
      await request.response.close();
    }
  }
  print('Server stopped.');
  await server.close();
  print('Server closed.');
}
