import '../swip.dart' as swip;
import 'dart:isolate';
Future<void> main(List<String> args) async {
  //int start = DateTime.now().microsecondsSinceEpoch;
  for (String f in args) {
    final isolate =await Isolate.spawn(swip.run,f);
    ReceivePort receivePort = ReceivePort();
    isolate.addOnExitListener(receivePort.sendPort);
    receivePort.listen((message) {
      receivePort.close();
    });
  }
  //int end = DateTime.now().microsecondsSinceEpoch;
  //int mics = end - start;
  //print("$mics μs");
}