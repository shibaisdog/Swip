import './function.dart' as F_FUNS;
void repl(String text) {
  if (text.trim() == "@override") {
    if (_getIndex(F_FUNS.Memory.runing_n) == -1) {
      F_FUNS.Memory.override.add(F_FUNS.Memory.runing_n);
      //F_Heap.Memory.VM_var = F_Heap.add_F(F_FUNS.Memory.runing_n,Heap.Memory.VM_var,F_Heap.removeLastElement(F_Heap.Memory.VM_var));
    }
  }
}
int _getIndex(String target) {
  return F_FUNS.Memory.override.indexWhere((element) => element == target);
}
bool override_ck(String func) {
  if (_getIndex(func) != -1) {
    return true;
  } else {
    return false;
  }
}