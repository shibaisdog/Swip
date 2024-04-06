import 'package:swip/Heap/Heap.dart' as Heap;
import 'package:swip/Heap/Class/Function-Heap.dart' as F_Heap;
import 'package:swip/Interpreter/function/function.dart' as F_FUNS;
import 'package:swip/Interpreter/function/extractValue.dart';
void repl(String text) {
  if (text.indexOf('=') < 0 ) {return;}
  String name = (text.substring(0,text.indexOf('='))).replaceAll(" ","");
  String value = (text.substring(text.indexOf('=')+1)).trim();
  if (F_FUNS.Memory.runing) {
    F_Heap.set(name,extractValue_var(value));
  } else {
    Heap.set(name,extractValue_var(value));
  }
}