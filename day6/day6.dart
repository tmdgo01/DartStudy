// quiz.txt 파일을 한 줄씩 조회하는 함수
// 각 라인 별 숫자들을 더한 값을 다음과 같이 저장하여 result.txt 파일에 저장
// C:\Users\ASD\Desktop\test\day6\quiz.txt
import 'dart:io';
import 'dart:convert';

// 파일을 읽어서 문자열로 반환하는 함수
Future<String> readFileToString(String filename) async {
  var file = File(filename);
  return await file.readAsString();
}

// 파일을 읽어서 줄 단위로 리스트로 반환하는 함수
Future<List<String>> readFileToList(String filename) async {
  var file = File(filename);
  return await file.readAsLines();
}

// 파일에 문자열을 쓰는 함수
Future<void> writeFile(String filename, String content) async {
  var file = File(filename);
  var sink = file.openWrite(mode: FileMode.write);
  sink.write(content);
  await sink.flush();
  await sink.close();
}

// 파일에 리스트를 쓰는 함수
Future<void> writeListToFile(String filename, List<int> data) async {
  var file = File(filename);
  var sink = file.openWrite(mode: FileMode.write);
  for (var item in data) {
    sink.writeln(item);
  }
  await sink.flush();
  await sink.close();
}

void main() {
  final filePath = "C:/Users/ASD/Desktop/test/day6/quiz.txt";
  final resultPath = "C:/Users/ASD/Desktop/test/day6/result.txt";
  // 파일을 줄 단위로 읽기
  // 각 줄의 숫자들을 더한 값을 result.txt에 저장
  readFileToList(filePath).then((lines) {
    var results = <int>[];
    for (var line in lines) {
      var numbers = line.split(',').map(int.parse);
      var sum = numbers.reduce((a, b) => a + b);
      results.add(sum);
    }
    writeListToFile(resultPath, results);
  });
  stdout.writeln("파일 읽기 및 쓰기 작업이 완료되었습니다.");
}
