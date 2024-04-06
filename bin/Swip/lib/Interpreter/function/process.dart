import 'package:swip/Heap/Heap.dart' as Heap;
import 'package:swip/Heap/Class/Function-Heap.dart' as F_Heap;
import 'function.dart' as F_FUNS;
void repl(String text) {
  if (text.startsWith("Heap.del")) {
    String target = (text.substring(text.indexOf("(")+1,text.indexOf(")"))).replaceAll(" ","");
    if (F_FUNS.Memory.runing) {
      F_Heap.del(target);
    } else {
      Heap.del(target);
    }
  } else if (text.startsWith("Heap.out")) {
    String target = (text.substring(text.indexOf("(")+1,text.indexOf(")"))).replaceAll(" ","");
    if (F_FUNS.Memory.runing) {
      print(F_Heap.get(target));
    } else {
      print(Heap.get(target));
    }
  } else {
    return;
  }
}