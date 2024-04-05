import '../function/extractValue.dart';
void repl(String text) {
  if (text.indexOf('print') < 0 ) {return;}
  String lip = (text.substring(text.indexOf('(')+1,text.indexOf(')')));
  if (extractValue_var(lip) == lip) {
    print(lip);
  } else {
    print(extractValue_var(lip));
  }
}