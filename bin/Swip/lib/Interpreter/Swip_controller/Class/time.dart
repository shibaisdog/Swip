String repl(String line) {
  line = line.replaceAll("time.time()",'"'+DateTime.now().microsecondsSinceEpoch.toString()+'"');
  line = line.replaceAll("time.now()",'"'+DateTime.now().toIso8601String()+'"');
  return line;
}