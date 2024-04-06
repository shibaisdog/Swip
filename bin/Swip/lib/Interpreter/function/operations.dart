String invalue(String line) {
  if (line.indexOf("+") != -1 && line.indexOf("-") != -1 && line.indexOf("*") != -1 && line.indexOf("/") != -1) {return line;}
  RegExp pattern = RegExp(r'(\d+)\s*([+\-*\/])\s*(\d+)');
  String result = line.replaceAllMapped(pattern, (match) {
    int operand1 = int.parse(match.group(1)!);
    String operator = match.group(2)!;
    int operand2 = int.parse(match.group(3)!);
    dynamic computedResult = 0;
    switch (operator) {
      case '+':
        computedResult = operand1 + operand2;
        break;
      case '-':
        computedResult = operand1 - operand2;
        break;
      case '*':
        computedResult = operand1 * operand2;
        break;
      case '/':
        computedResult = operand1 / operand2;
        break;
    }
    return computedResult.toString();
  });
  return result;
}