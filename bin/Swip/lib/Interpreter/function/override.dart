import './function.dart' as F_FUNS;
void repl(String text) {
  if (text.trim().startsWith("@override")) {
    if (_getIndex(F_FUNS.Memory.runing_n) == -1) {
      if (text.indexOf("(") != -1 && text.indexOf(")") != -1) {
        String _args = text.substring(text.indexOf("(")+1,text.indexOf(")")).trim();
        if (_args.isEmpty) {
          F_FUNS.Memory.override.add([F_FUNS.Memory.runing_n,[]]);
        } else {
          F_FUNS.Memory.override.add([F_FUNS.Memory.runing_n,_args.split(",")]);
        }
      } else {
        F_FUNS.Memory.override.add([F_FUNS.Memory.runing_n,[]]);
      }
    }
  }
}
int _getIndex(String target) {
  return F_FUNS.Memory.override.indexWhere((element) => element[0] == target);
}
bool override_ck(String func) {
  if (_getIndex(func) != -1) {
    return true;
  } else {
    return false;
  }
}
List<dynamic> get_data(String target) {
  int index = _getIndex(target);
  return F_FUNS.Memory.override[index][1];
}