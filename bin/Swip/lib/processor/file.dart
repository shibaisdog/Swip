import 'dart:io';
Future<String> read(String file) async {
  File f = File(file);
  return f.readAsStringSync();
}
void write(String file,text) {
  File f = File(file);
  f.writeAsStringSync(text);
}