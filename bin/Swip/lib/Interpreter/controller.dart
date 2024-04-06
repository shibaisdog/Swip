import '../Heap/Class/function.dart' as F_Heap;
import './function/function.dart' as F_FUNS;
import './Swip_controller/variable.dart' as variable;
import './Swip_controller/print.dart' as prints;
import './function/process.dart' as heapa;
import './function/extractValue.dart';
void doing(String line) {
  heapa.repl(line);
  if (F_FUNS.Memory.define_b) {
    F_FUNS.repl(line);
    F_Heap.push(F_FUNS.Memory.define_n, line, F_FUNS.Memory.define_args);
    return;
  }
  variable.repl(line);
  prints.repl(line);
  line = extractValue(line);
  F_FUNS.repl(line);
}