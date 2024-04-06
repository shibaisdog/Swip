import 'package:swip/Interpreter/function/operations.dart';
import 'package:swip/Interpreter/function/extractValue.dart';
String repl(String line) {
  if (line.contains("Math")) {
    String calculation = line.substring(line.indexOf("(") + 1, line.lastIndexOf(")"));
    String result = invalue(extractValue_var(calculation)).replaceAll(" ", "");
    line = line.replaceFirst("Math(" + calculation + ")", result);
  }
  return line;
}