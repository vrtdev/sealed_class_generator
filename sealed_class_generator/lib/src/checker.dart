class Checker {
  static void checkInputValidity(
    String className,
    List<String> typeParams,
  ) {
    if ((className?.isEmpty ?? true) == true) {
      throw "Could not determine the `className.`";
    }

    if (typeParams.isEmpty || typeParams.length <= 1) {
      throw "You should have more than one type parameter.";
    }
  }
}
