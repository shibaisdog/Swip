import './Class/commands.dart';
void manag(List<String> args) {
  for (String f in args) {
    version(f);
    run(f);
  }
}