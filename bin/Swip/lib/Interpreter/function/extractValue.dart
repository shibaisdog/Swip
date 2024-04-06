import 'package:swip/Heap/Heap.dart' as Heap;
import 'package:swip/Heap/Class/Function-Heap.dart' as F_Heap;
import './function.dart' as F_FUNS;
String extractValue(String input) {
  List<String> words = input.split(' ');
  String result = '';
  for (String word in words) {
    if (word != "print" && word.startsWith('\$') && RegExp(r'[a-zA-Z]').hasMatch(word.substring(1))) {
      result += getValue(word.substring(1));
    } else {
      result += word;
    }
    result += ' ';
  }
  return result.trimRight();
}
String extractValue_var(String word) {
  String result = '';
  if (RegExp('^"(.*)"').hasMatch(word)) {
    word = word.replaceAll('"',"");
    List<String> words = word.split(' ');
    for (String line in words) {
      if (line.startsWith('\$') && RegExp(r'[a-zA-Z]').hasMatch(line.substring(1))) {
        result += getValue(line.substring(1));
      } else {
        result += line;
      }
      result += ' ';
    }
  } else {
    if (RegExp(r'^-?[0-9]+$').hasMatch(word) || ["true", "false", "null"].contains(word)) {
      result += word;
    } else {
      result += getValue(word);
    }
  }
  return result.trimRight();
}
String getValue(String word) {
  if (F_FUNS.Memory.runing) {
    return (F_Heap.Memory.get(F_FUNS.Memory.runing_n,word)).toString();
  } else {
    return (Heap.get(word)).toString();
  }
}