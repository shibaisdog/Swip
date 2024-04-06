import './time.dart' as times;
import './Math.dart' as maths;
class Memory {
  static bool T = false;
  static bool M = false;
}
String repl(String line) {
  if (line.indexOf("using") != -1) {
    String name = line.substring(line.indexOf("using")+5);
    if (name.trim() == "time") {
      Memory.T = true;
    } else if (name.trim() == "math") {
      Memory.M = true;
    }
  } else {
    if (Memory.T) {
      line = times.repl(line);
    }
    if (Memory.M) {
      line = maths.repl(line);
    }
  }
  return line;
}