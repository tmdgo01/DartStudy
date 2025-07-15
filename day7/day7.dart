import 'dart:math';
import 'dart:io';
import 'dart:async';
import 'dart:convert';

Future main() async {
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

  Map<String, String> capital = {
    "Korea": "Seoul",
    "Japan": "Tokyo",
    "China": "Beijing",
    "Canada": "Ottawa",
    "Australia": "Canberra",
    "USA": "Washington DC",
    "France": "Paris",
    "Germany": "Berlin",
    "Italy": "Rome",
    "Spain": "Madrid",
  };

  var server = await HttpServer.bind(InternetAddress.loopbackIPv4, 8080);
  print("Server running on http://${server.address.address}:${server.port}");

  await for (HttpRequest request in server) {
    final method = request.method;
    final path = request.uri.path; // 예: /capital=Korea

    try {
      if (method == 'GET') {
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
          // 예 /all
          // 모든 나라-수도 JSON 출력
          request.response
            ..statusCode = HttpStatus.ok
            ..headers.contentType = ContentType.json
            ..write(jsonEncode(capital));
        } else {
          request.response
            ..statusCode = HttpStatus.badRequest
            ..headers.contentType = ContentType.text
            ..write("잘못된 요청입니다.");
        }
      } else if (method == 'DELETE') {
        if (path.startsWith('/delete=')) {
          // 예: /delete=Korea
          final country = Uri.decodeComponent(
            path.substring('/delete='.length),
          );
          if (capital.containsKey(country)) {
            capital.remove(country);
            // 삭제 후 남아있는 데이터 JSON 반환
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
        } else {
          request.response
            ..statusCode = HttpStatus.badRequest
            ..headers.contentType = ContentType.text
            ..write("잘못된 DELETE 요청입니다.");
        }
      } else if (method == 'PUT') {
        if (path.startsWith('/update=')) {
          final params = Uri.decodeComponent(path.substring('/update='.length));
          final parts = params.split(',');
          if (parts.length == 2) {
            final country = parts[0].trim();
            final newCapital = parts[1].trim();
            if (capital.containsKey(country)) {
              capital[country] = newCapital;
              request.response
                ..statusCode = HttpStatus.ok
                ..headers.contentType = ContentType.text
                ..write("$country의 수도가 $newCapital(으)로 수정되었습니다.");
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
              ..write("잘못된 형식입니다. /update=나라,수도 형식으로 요청하세요.");
          }
        } else {
          request.response
            ..statusCode = HttpStatus.badRequest
            ..headers.contentType = ContentType.text
            ..write("잘못된 PUT 요청입니다.");
        }
      } else if (method == 'POST') {
        if (path.startsWith('/add=')) {
          final params = Uri.decodeComponent(path.substring('/add='.length));
          final parts = params.split(',');
          if (parts.length == 2) {
            final country = parts[0].trim();
            final newCapital = parts[1].trim();
            if (capital.containsKey(country)) {
              request.response
                ..statusCode = HttpStatus.conflict
                ..headers.contentType = ContentType.text
                ..write("이미 존재하는 나라입니다.");
            } else {
              capital[country] = newCapital;
              request.response
                ..statusCode = HttpStatus.ok
                ..headers.contentType = ContentType.text
                ..write("$country과(와) $newCapital 수도가 추가되었습니다.");
            }
          } else {
            request.response
              ..statusCode = HttpStatus.badRequest
              ..headers.contentType = ContentType.text
              ..write("잘못된 형식입니다. /add=나라,수도 형식으로 요청하세요.");
          }
        } else {
          request.response
            ..statusCode = HttpStatus.badRequest
            ..headers.contentType = ContentType.text
            ..write("잘못된 POST 요청입니다.");
        }
      } else {
        // 지원하지 않는 메서드
        request.response
          ..statusCode = HttpStatus.methodNotAllowed
          ..headers.contentType = ContentType.text
          ..write("지원하지 않는 HTTP 메서드입니다.");
      }
    } catch (e) {
      request.response
        ..statusCode = HttpStatus.internalServerError
        ..headers.contentType = ContentType.text
        ..write("서버 오류가 발생했습니다: $e");
    }

    await request.response.close();
  }

  // 2. DELETE 메서드를 사용해 입력한 나라를 삭제하는 기능을 구현하세요.
  // 경로는 /delete=나라 이름 이며,
  // 해당 데이터를 삭제한 후 남아있는 나라들을 반환해야 합니다.
  // 반환되는 데이터는 JSON 형식이여야 합니다.

  // Q4 나라-수도 수정 기능
  // PUT 메서드를 사용해 나라의 수도를 수정하는 기능
  // 경로는 /update=나라,수도 형식이며,
  // 예를 들어 /update=Korea,Seoul 과 같이 요청하면
  // Korea의 수도를 Seoul로 수정합니다.

  // Q5 나라-수도 추가 기능
  // POST 메서드를 사용해 새로운 나라와 수도를 추가하는 기능
  // 경로는 /add=나라,수도 형식이며,
  // 예를 들어 /add=Korea,Seoul 과 같이 요청하면
  // 새로운 나라와 수도를 추가합니다.
}

// GET 메서드를 사용해 모든 나라의 수도를 출력하는 기능
