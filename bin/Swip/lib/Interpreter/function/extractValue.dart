import 'package:swip/Heap/Heap.dart' as Heap;
import 'package:swip/Heap/Class/Function-Heap.dart' as F_Heap;
import './function.dart' as F_FUNS;
String extractValue(String input) {
  List<String> words = input.split(' ');
  String result = '';
    for (String word in words) {
      if (word.indexOf('print') == -1 && word.length > 1 && word[0] == '&' && RegExp(r'[a-zA-Z]').hasMatch(word.substring(1))) {
        if (F_FUNS.Memory.runing) {
          result += (F_Heap.get(word.substring(1))).toString();
        } else {
          result += (Heap.get(word.substring(1))).toString();
        }
      } else {
        result += word;
      }
      result += ' ';
    } 
  if (result.isNotEmpty) {
    result = result.substring(0, result.length - 1);
  }
  return result;
}
String extractValue_var(String word) {
  String result = '';
  if (RegExp('^"(.*)"').hasMatch(word)) {
    word = word.replaceAll('"',"");
    List<String> words = word.split(' ');
    for (String line in words) {
      if (line.length > 1 && line[0] == '&' && RegExp(r'[a-zA-Z]').hasMatch(line.substring(1))) {
        if (F_FUNS.Memory.runing) {
          result += (F_Heap.get(line.substring(1))).toString();
        } else {
          result += (Heap.get(line.substring(1))).toString();
        }
      } else {
        result += line;
      }
      result += ' ';
    }
  } else {
    if (RegExp(r'^[0-9]+$').hasMatch(word)) {
      result += word;
    } else {
      if (word == "true" || word == "false" || word == "null") {
        result += word;
      } else {
        //result += (get(word)).toString();
        if (F_FUNS.Memory.runing) {
          result += (F_Heap.get(word)).toString();
        } else {
          result += (Heap.get(word)).toString();
        }
      }
    }
  }
  return result;
}