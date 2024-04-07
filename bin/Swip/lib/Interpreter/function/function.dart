import 'package:swip/Heap/Class/function.dart' as F_Heap;
class Memory {
  static bool runing = false;
  static String runing_n = "";
  static List<String> runing_L = [];
  static bool define_b = false;
  static String define_n = "";
  static List<String> define_args = [];
  static List<List<dynamic>> override = [];
}
void repl(String text) {
  if (text.indexOf('(') != -1 && text.indexOf(')') != -1 && !Memory.define_b && text.indexOf('fun') == -1 && text.indexOf('}') == -1 && text.indexOf('print') == -1) {
    String name = (text.substring(0,text.indexOf('('))).replaceAll(" ","");
    List<String> __args = (text.substring(text.indexOf('(')+1,text.indexOf(')'))).replaceAll(" ","").split(",");
    F_Heap.run(name,__args);
    return;
  }
  if (text.indexOf('fun') < 0 && text.indexOf('}') < 0) {return;}
  if (text.indexOf('}') != -1) {
    Memory.define_b = false;
    Memory.define_n = "";
    Memory.define_args = [];
    return;
  } else {
    String name = (text.substring(text.indexOf('fun')+3,text.indexOf('('))).replaceAll(" ","");
    List<String> __args = (text.substring(text.indexOf('(')+1,text.indexOf(')'))).split(",");
    Memory.define_b = true;
    Memory.define_n = name;
    Memory.define_args = __args;
  }
}