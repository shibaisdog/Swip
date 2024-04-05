import '../swip.dart' as swip;
Future<void> main(List<String> args) async {
  for (String f in args) {
    swip.run(f);
  }
}