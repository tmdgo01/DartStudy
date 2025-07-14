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

  // files 폴더 내에 다음의 Map 변수의 key 가 파일명이 되고,
  // value 가 각 파일의 내용이 되도록 하는 코드를 구현하세요.
  // 각 폴더들은 ./day6/files 폴더에 저장되어야 합니다.
  // 각 파일의 확장자는 .txt 입니다.
  // void main() {
  //   var files = {
  //     "file1": "file1 파일 내용입니다.",
  //     "file2": "file2 파일 내용입니다.",
  //     "file3": "file3 파일 내용입니다.",
  //   };
  // }
  var files = {
    "file1.txt": "file1 파일 내용입니다.",
    "file2.txt": "file2 파일 내용입니다.",
    "file3.txt": "file3 파일 내용입니다.",
  };
  var dir = Directory('./day6/files');
  if (!dir.existsSync()) {
    dir.createSync(recursive: true);
  }
  for (var entry in files.entries) {
    var file = File('${dir.path}/${entry.key}');
    var sink = file.openWrite(mode: FileMode.write);
    sink.write(entry.value);
    // await sink.flush();
    // await sink.close();
  }
  stdout.writeln("파일 생성 완료");

  // 사용자에게 저장할 파일 이름과 내용을 입력받아,
  // 해당 이름의 파일을 './day6' 폴더 안에 생성하고, 입력받은 내용을 저장한 뒤
  // 다시 파일을 읽어 내용을 출력하는 프로그램을 완성하세요.
  // stdout.write("저장할 파일 이름을 입력하세요 (예: note.txt): ");
  // String filename = stdin.readLineSync()!;
  // stdout.write("저장할 파일 내용을 입력하세요: ");
  // String content = stdin.readLineSync()!;
  // // 파일 객체 생성
  // ___________________;
  // // 파일 스트림 열기 및 쓰기
  // __________________________;
  // __________________;
  // // 스트림 닫기
  // ___________;
  // // 파일 다시 읽어서 출력
  // String result = ____________________________;
  // print(result);
  stdout.write("저장할 파일 이름을 입력하세요 (예: note.txt): ");
  String filename = stdin.readLineSync()!;

  stdout.write("저장할 파일 내용을 입력하세요: ");
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
  stdout.writeln("파일 생성 및 읽기 작업이 완료되었습니다.");
}
