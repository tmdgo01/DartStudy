// quiz.txt 파일을 한 줄씩 조회하는 함수
// 각 라인 별 숫자들을 더한 값을 다음과 같이 저장하여 result.txt 파일에 저장
// C:\Users\ASD\Desktop\test\day6\quiz.txt
import 'dart:io';

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

void main() async {
  final filePath = "C:/Users/ASD/Desktop/test/day6/quiz.txt";
  final resultPath = "C:/Users/ASD/Desktop/test/day6/result.txt";
  final resultPath2 = "C:/Users/ASD/Desktop/test/day6/result2.txt";
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
  stdout.writeln("파일 읽기 및 쓰기 작업(덧셈)이 완료되었습니다.");

  readFileToList(filePath).then((lines) {
    var results2 = <int>[];
    for (var line in lines) {
      var numbers = line.split(',').map(int.parse);
      var mul = numbers.reduce((a, b) => a * b);
      results2.add(mul);
    }
    writeListToFile(resultPath2, results2);
  });
  stdout.writeln("파일 읽기 및 쓰기 작업(곱셈)이 완료되었습니다.");

  // Q1
  var file = File('C:/Users/ASD/Desktop/test/day6/temp.txt');
  // 파일에 문자열 저장
  var sink = file.openWrite(mode: FileMode.write);
  sink.write('Dart는 재미있어요!');
  await sink.flush();
  await sink.close();
  // 저장한 내용을 다시 읽기
  String content = await file.readAsString();
  print(content);

  // Q2
  var files = {
    "file1.txt": "1111111111",
    "file2.txt": "22222222222",
    "file3.txt": "333333333333",
  };
  var dir = Directory('./day6/files');
  if (!dir.existsSync()) {
    dir.createSync(recursive: true);
  }
  for (var entry in files.entries) {
    var file22 = File('${dir.path}/${entry.key}');
    var sink22 = file22.openWrite(mode: FileMode.write);
    sink22.write(entry.value);
    // await sink.flush();
    // await sink.close();
  }
  stdout.writeln("파일 생성 완료");

  // Q3
  stdout.write("저장할 파일 이름 입력 (예: note.txt): ");
  String filename = stdin.readLineSync()!;

  stdout.write("저장할 파일 내용 입력: ");
  String content11 = stdin.readLineSync()!;
  // 파일 객체 생성
  var file11 = File('./day6/$filename');
  // 파일 스트림 열기 및 쓰기
  var sink11 = file11.openWrite(mode: FileMode.write);

  sink11.write(content11);
  // 스트림 닫기
  await sink11.flush();
  await sink11.close();
  // 파일 다시 읽어서 출력
  String result11 = await file11.readAsString();
  print(result11);
  stdout.writeln("작업 완료");
}
