// library_management
// 수정 사항
// 책 관리 ( 등록, 수정, 삭제, 수량 )
// 사용자 관리( 등록, 수정, 삭제, 조회 )
// 현재 대여 상태 전체 출력 (GET /library/status)
// 특정 사용자 대여 내역 (GET /library/user/{id})

import 'dart:convert';
import 'dart:io';

final Map<String, String> users = {}; // 사용자 DB: 학번 - 이름

final Map<String, String> library = {
  "001": "차라투스트라는 이렇게 말했다.",
  "002": "용의자 X 의 헌신",
  "003": "정의란 무엇인가",
  "004": "존재와 시간",
  "005": "죽음의 수용소에서",
};

final Map<String, String?> rentalStatus = {
  "001": null,
  "002": null,
  "003": null,
  "004": null,
  "005": null,
};

Future<void> main() async {
  final server = await HttpServer.bind(InternetAddress.loopbackIPv4, 3000);
  print('[-] 도서관 서버 실행 중: http://${server.address.address}:${server.port}');

  await for (HttpRequest request in server) {
    final method = request.method;
    final segments = request.uri.pathSegments;

    try {
      if (method == 'POST') {
        if (segments.length == 1 && segments[0] == 'user') {
          await handleUserRegistration(request);
        } else if (segments.length == 4 && segments[0] == 'library') {
          final action = segments[1];
          final bookId = segments[2];
          final userId = segments[3];

          if (action == 'rental') {
            await handleRental(request, bookId, userId);
          } else if (action == 'return') {
            await handleReturn(request, bookId, userId);
          } else {
            await sendResponse(request, '잘못된 도서관 액션입니다.');
          }
        } else {
          await sendResponse(request, '지원하지 않는 경로입니다.');
        }
      } else {
        await sendResponse(request, '허용되지 않는 메서드입니다.');
      }
    } catch (e) {
      await sendResponse(request, '서버 오류: $e');
    }
  }
}

// [v] 사용자 등록 처리
Future<void> handleUserRegistration(HttpRequest request) async {
  final content = await utf8.decoder.bind(request).join();
  final Map<String, dynamic> data = jsonDecode(content);

  for (var entry in data.entries) {
    final id = entry.key;
    final name = entry.value;

    if (users.containsKey(id)) {
      await sendResponse(request, '! 사용자 [$id]는 이미 등록되어 있습니다.');
      return;
    }

    users[id] = name;
    await sendResponse(request, '[v] 사용자 [$id - $name] 등록 완료.');
    return;
  }

  await sendResponse(request, '등록할 사용자 정보가 없습니다.');
}

Future<void> handleRental(
  HttpRequest request,
  String bookId,
  String userId,
) async {
  if (!users.containsKey(userId)) {
    return sendResponse(request, '사용자 [$userId]는 등록되어 있지 않습니다.');
  }

  if (!library.containsKey(bookId)) {
    return sendResponse(request, '책 [$bookId]는 도서관에 없습니다.');
  }

  if (rentalStatus[bookId] != null) {
    return sendResponse(request, '책 [$bookId]는 이미 대여 중입니다.');
  }

  if (rentalStatus.containsValue(userId)) {
    return sendResponse(request, '[$userId]님은 이미 다른 책을 대여 중입니다.');
  }

  rentalStatus[bookId] = userId;
  return sendResponse(
    request,
    '[v] [$userId]님이 "${library[bookId]}" 도서를 대여했습니다.',
  );
}

Future<void> handleReturn(
  HttpRequest request,
  String bookId,
  String userId,
) async {
  if (!users.containsKey(userId)) {
    return sendResponse(request, '사용자 [$userId]는 등록되어 있지 않습니다.');
  }

  if (!library.containsKey(bookId)) {
    return sendResponse(request, '책 [$bookId]는 도서관에 없습니다.');
  }

  if (rentalStatus[bookId] != userId) {
    return sendResponse(request, '[$bookId]는 [$userId]님의 대여 기록이 없습니다.');
  }

  rentalStatus[bookId] = null;
  return sendResponse(
    request,
    '[v] [$userId]님이 "${library[bookId]}" 도서를 반납했습니다.',
  );
}

Future<void> sendResponse(HttpRequest request, String message) async {
  print("[+] 응답: $message");
  request.response
    ..statusCode = HttpStatus.ok
    ..headers.contentType = ContentType.text
    ..write(message);
  await request.response.close();
}
