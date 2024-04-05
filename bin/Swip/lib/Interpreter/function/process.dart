import '../../Heap/Heap.dart' as Heap;
void repl(String text) {
  if (text.startsWith("Heap.del")) {
    String target = (text.substring(text.indexOf("(")+1,text.indexOf(")"))).replaceAll(" ","");
    Heap.del(target);
  } else if (text.startsWith("Heap.out")) {
    String target = (text.substring(text.indexOf("(")+1,text.indexOf(")"))).replaceAll(" ","");
    print(Heap.get(target));
  } else {
    return;
  }
}