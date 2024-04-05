import 'package:swip/Interpreter/controller.dart' as contr;
import 'package:swip/Heap/Heap.dart' as Heap;
class Memory {
  static List<List<dynamic>> VM_var = [];
  static List<List<dynamic>> BACKUP_Heap = [];
}
void push(String name,String line) {
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
    Memory.VM_var.add([name,[line]]);
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
dynamic run(String target) {
  int? index;
  for (int i = 0; i < Memory.VM_var.length; i++) {
    if (Memory.VM_var[i][0] == target) {
      index = i;
      break;
    }
  }
  if (index != null) {
    Memory.BACKUP_Heap = List.from(Heap.Memory.VM_var);
    List<String> RUNNING = (Memory.VM_var[index][1] as List<String>);
    for (String l in RUNNING) {
      contr.doing(l);
    }
    Heap.Memory.VM_var = [];
    Heap.Memory.VM_var = List.from(Memory.BACKUP_Heap);
    Memory.BACKUP_Heap = [];
  } else {
    return null;
  }
}