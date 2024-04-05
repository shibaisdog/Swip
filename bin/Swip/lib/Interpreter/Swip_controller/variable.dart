import '../../Heap/Heap.dart' as Heap;
import '../function/extractValue.dart';
void repl(String text) {
  if (text.indexOf('=') < 0 ) {return;}
  String name = (text.substring(0,text.indexOf('='))).replaceAll(" ","");
  String value = (text.substring(text.indexOf('=')+1)).trim();
  Heap.set(name,extractValue_var(value));
}