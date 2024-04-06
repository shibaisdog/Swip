import 'package:swip/Heap/auto-type.dart';
class Memory {
  static List<List<dynamic>> VM_var = [];
  static void set(String fun_name,String name,dynamic value) {
    final index = _getIndex(fun_name,name);
    if (index != -1) {
      Memory.VM_var[index][2] = auto(value);
    } else {
      Memory.VM_var.add([fun_name,name,auto(value)]);
    }
  }
  static void del(String fun_name,String target) {
    final index = _getIndex(fun_name,target);
    if (index != -1) {
      Memory.VM_var.removeAt(index);
    } else {
      throw Exception("Memory Reference Error");
    }
  }
  static dynamic get(String fun_name,String target) {
    final index = _getIndex(fun_name,target);
    return index != -1 ? Memory.VM_var[index][2] : null;
  }
  static int _getIndex(String fun_name, [String? name]) {
    if (name != null) {
      return Memory.VM_var.indexWhere((element) => element[0] == fun_name && element[1] == name);
    } else {
      return Memory.VM_var.indexWhere((element) => element[0] == fun_name);
    }
  }
  static void resetByFunName(String fun_name) {
    final index = _getIndex(fun_name);
    if (index != -1) {
      Memory.VM_var.removeAt(index);
    } else {}
  }
}