import 'auto-type.dart';
class Memory {
  static List<List<dynamic>> VM_var = [];
}
void set(String name,dynamic value) {
  if (get(name) != null) {
    int? index;
    for (int i = 0; i < Memory.VM_var.length; i++) {
      if (Memory.VM_var[i][0] == name) {
        index = i;
        break;
      }
    }
    if (index != null) {
      Memory.VM_var[index][1] = auto(value);
    } else {
      throw Exception("Memory Reference Error");
    }
  } else {
    Memory.VM_var.add([name,auto(value)]);
  }
}
void del(String target) {
  int? index;
  for (int i = 0; i < Memory.VM_var.length; i++) {
    if (Memory.VM_var[i][0] == target) {
      index = i;
      break;
    }
  }
  if (index != null) {
    Memory.VM_var.removeAt(index);
  } else {
    throw Exception("Memory Reference Error");
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