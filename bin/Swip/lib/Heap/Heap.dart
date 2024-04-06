import 'auto-type.dart';
class Memory {
  static List<List<dynamic>> VM_var = [];
}
void set(String name,dynamic value) {
  final index = _getIndex(name);
  if (index != -1) {
    Memory.VM_var[index][1] = auto(value);
  } else {
    Memory.VM_var.add([name,auto(value)]);
  }
}
void del(String target) {
  final index = _getIndex(target);
  if (index != -1) {
    Memory.VM_var.removeAt(index);
  } else {
    throw Exception("Memory Reference Error");
  }
}
dynamic get(String target) {
  final index = _getIndex(target);
  return index != -1 ? Memory.VM_var[index][1] : null;
}
int _getIndex(String target) {
  return Memory.VM_var.indexWhere((element) => element[0] == target);
}