import 'package:swip/Interpreter/controller.dart' as contr;
import 'package:swip/processor/file.dart' as file;
import 'dart:isolate';
void run(String files) async {
  String text = await file.read(files);
  List<String> line = text.split('\n');
  for (String i in line) {
    if (i.isEmpty) {return;}
    contr.doing(i);
  }
}
void thread(String file) async {
  final isolate = await Isolate.spawn(run,file);
  ReceivePort receivePort = ReceivePort();
  isolate.addOnExitListener(receivePort.sendPort);
  receivePort.listen((message) {
    receivePort.close();
  });
}