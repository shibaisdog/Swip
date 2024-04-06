import 'package:swip/Heap/Class/function.dart' as F_Heap;
void repl(String line) {
  if (line.indexOf("doing") != -1) {
    String _Do = line.substring(0,line.indexOf("->"));
    String _Da = line.substring(line.indexOf("->")+2);
    int runing = int.parse(_Do.substring(_Do.indexOf("(")+1,_Do.indexOf(")")).replaceAll(" ",""));
    String fun_name = _Da.substring(0,_Da.indexOf("(")).replaceAll(" ","");
    List<String> fun_args = (_Da.substring(_Da.indexOf('(')+1,_Da.indexOf(')'))).replaceAll(" ","").split(",");
    for (int i = 0; i < runing; i++) {
      F_Heap.run(fun_name,fun_args);
    }
  }
}