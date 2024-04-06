String repl(String line) {
  int timestamp = DateTime.now().millisecondsSinceEpoch;
  line = line.replaceAll("time()",timestamp.toString());
  return line;
}