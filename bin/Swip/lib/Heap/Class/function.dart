import 'package:swip/Interpreter/controller.dart' as contr;
import 'package:swip/Heap/Class/Function-Heap.dart' as F_Heap;
import 'package:swip/Interpreter/function/function.dart' as F_FUNS;
class Memory {
  static List<List<dynamic>> VM_var = [];
}
void push(String name,String line,List<String> args) {
  if (get(name) != null) {
    int? index;
    for (int i = 0; i < Memory.VM_var.length; i++) {
      if (Memory.VM_var[i][0] == name) {
        index = i;
        break;
      }
    }
    if (index != null) {
      (Memory.VM_var[index][1] as List).add(line);
    } else {
      throw Exception("Memory Reference Error");
    }
  } else {
    Memory.VM_var.add([name,[line],args]);
  }
}
dynamic get(String target) {
  int? index;
  for (int i = 0; i < Memory.VM_var.length; i++) {
    if (Memory.VM_var[i][0] == target) {
      index = i;
      break;
    }
  }
  if (index != null) {
    return Memory.VM_var[index][1];
  } else {
    return null;
  }
}
dynamic run(String target,List<String> doing_args) {
  int? index;
  for (int i = 0; i < Memory.VM_var.length; i++) {
    if (Memory.VM_var[i][0] == target) {
      index = i;
      break;
    }
  }
  if (index != null) {
    F_Heap.reset();
    F_FUNS.Memory.runing = true;
    List<String> RUNNING = (Memory.VM_var[index][1] as List<String>);
    int j = 0;
    if (doing_args.length != 0) {
      for (j = 0; j < doing_args.length; j++) {
        String inj = (Memory.VM_var[index][2] as List<String>)[j]+" = "+(doing_args[j]);
        RUNNING.insert(0,inj);
      }
    }
    for (String l in RUNNING) {
      contr.doing(l);
    }
    RUNNING.removeRange(0,j);
    F_FUNS.Memory.runing = false;
  } else {
    return null;
  }
}