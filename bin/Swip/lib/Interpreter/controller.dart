import '../Heap/Class/function.dart' as F_Heap;
import './Swip_controller/function.dart' as F_FUNS;
import './Swip_controller/variable.dart' as variable;
import './Swip_controller/print.dart' as prints;
import 'function/process.dart' as heapa;
import 'function/extractValue.dart';
void doing(String line) {
  if (F_FUNS.Memory.define_b) {
    F_FUNS.repl(line);
    F_Heap.push(F_FUNS.Memory.define_n, line);
    return;
  }
  variable.repl(line);
  line = extractValue(line);
  heapa.repl(line);
  prints.repl(line);
  F_FUNS.repl(line);
}