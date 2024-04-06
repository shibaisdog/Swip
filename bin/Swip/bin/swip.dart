import 'package:swip/Interpreter/controller.dart' as contr;
import 'package:swip/processor/file.dart' as file;
//import 'package:swip/Heap/Heap.dart' as Heap;
void run(String files) async {
  String text = await file.read(files);
  List<String> line = text.split('\n');
  for (String i in line) {
    if (i.isEmpty) {return;}
    contr.doing(i);
  }
}