dynamic auto(String value) {
  try {
    int Type_int = int.parse(value);
    return Type_int;
  } catch (_) {}

  try {
    double Type_double = double.parse(value);
    return Type_double;
  } catch (_) {}

  try {
    bool Type_bool = bool.parse(value);
    return Type_bool;
  } catch (_) {}

  return value as dynamic;
}