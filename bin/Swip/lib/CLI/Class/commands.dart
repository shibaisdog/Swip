import 'dart:io';
import './thread.dart';
void version(String args) {
  if (
    args == "-v" || 
    args == "--v" ||
    args == "-version" ||
    args == "--version"
  ) {
    print('Swip 1.0.0 at (Dart ${Platform.version})');
    exit(0);
  }
}
void run(String args) {
  thread(args);
}