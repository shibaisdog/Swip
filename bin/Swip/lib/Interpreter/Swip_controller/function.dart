import '../../Heap/Class/function.dart' as F_Heap;
class Memory {
  static bool define_b = false;
  static String define_n = "";
}
void repl(String text) {
  if (text.indexOf('fun') < 0 && text.indexOf('end()') < 0 && text.indexOf('run') < 0) {return;}
  if (text.indexOf('end()') != -1) {
    Memory.define_b = false;
    Memory.define_n = "";
    return;
  } else if (text.indexOf('run') != -1 && !Memory.define_b) {
    String name = (text.substring(text.indexOf('run')+3,text.indexOf('('))).replaceAll(" ","");
    F_Heap.run(name);
    return;
  } else {
    String name = (text.substring(text.indexOf('fun')+3,text.indexOf('('))).replaceAll(" ","");
    //String __args = (text.substring(text.indexOf('(')+1,text.indexOf(')')));
    Memory.define_b = true;
    Memory.define_n = name;
  }
}