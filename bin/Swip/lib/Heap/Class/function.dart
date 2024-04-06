import 'package:swip/Interpreter/controller.dart' as contr;
import 'package:swip/Heap/Heap.dart' as Heap;
import 'package:swip/Heap/Class/Function-Heap.dart' as F_Heap;
import 'package:swip/Interpreter/function/function.dart' as F_FUNS;
import 'package:swip/Interpreter/function/override.dart' as override;
class Memory {
  static List<List<dynamic>> VM_var = [];
}
void push(String name,String line,List<String> args) {
  final index = _getIndex(name);
  if (index != -1) {
    (Memory.VM_var[index][1] as List).add(line);
  } else {
    Memory.VM_var.add([name,[line],args]);
  }
}
dynamic get(String target) {
  final index = _getIndex(target);
  return index != -1 ? Memory.VM_var[index][1] : null;
}
dynamic run(String target,List<String> doing_args) {
  final index = _getIndex(target);
  if (index != -1) {
    F_FUNS.Memory.runing = true;
    F_FUNS.Memory.runing_n = target;
    F_FUNS.Memory.runing_L.add(target);
    List<String> RUNNING = (Memory.VM_var[index][1] as List<String>);
    int j = 0;
    if (doing_args.length != 0 && Memory.VM_var[index][2][0].length != 0) {
      for (j = 0; j < doing_args.length; j++) {
        String inj = (Memory.VM_var[index][2] as List<String>)[j]+" = "+(doing_args[j]);
        RUNNING.insert(0,inj);
      }
    }
    for (String l in RUNNING) {
      contr.doing(l);
    }
    RUNNING.removeRange(0,j);
    int a = F_FUNS.Memory.runing_L.indexOf(target);
    F_FUNS.Memory.runing_L.remove(target);
    if (F_FUNS.Memory.runing_L.isEmpty) {
      F_FUNS.Memory.runing = false;
    } else {
      if (a > 0) {
        String valueBeforeDeleted = F_FUNS.Memory.runing_L[a - 1];
        F_FUNS.Memory.runing_n = valueBeforeDeleted;
      } else {}
    }
    try {
      if (override.override_ck(target)) {
        Heap.Memory.VM_var = add(Heap.Memory.VM_var,removeLastElement(F_Heap.Memory.VM_var));
        F_FUNS.Memory.override.remove(target);
      }
    } catch (error) {}
    F_Heap.Memory.resetByFunName(target);
  } else {
    return null;
  }
}
int _getIndex(String target) {
  return Memory.VM_var.indexWhere((element) => element[0] == target);
}
List<List<dynamic>> removeLastElement(List<List<dynamic>> list) {
  return list.map((innerList) {
    return innerList.sublist(1,innerList.length);
  }).toList();
}
List<List<dynamic>> add(List<List<dynamic>> a,List<List<dynamic>> b) {
  List<List<dynamic>> NEWLIST = a + b;
  Map<String,dynamic> name_list = {};
  for (List<dynamic> NI in NEWLIST) {
    name_list[NI[0].toString()] = NI[1];
  }
  List<List<dynamic>> listOfLists = name_list.entries.map((entry) => [entry.key, entry.value]).toList();
  return listOfLists;
}
List<List<dynamic>> add_F(String name,List<List<dynamic>> a,List<List<dynamic>> b) {
  List<List<dynamic>> NEWLIST = a + b;
  Map<String,dynamic> name_list = {};
  for (List<dynamic> NI in NEWLIST) {
    name_list[NI[0].toString()] = NI[1];
  }
  List<List<dynamic>> listOfLists = name_list.entries.map((entry) => [name,entry.key, entry.value]).toList();
  return listOfLists;
}