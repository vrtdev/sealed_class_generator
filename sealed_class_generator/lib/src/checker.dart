class Checker {
  static void checkInputValidity(
    String className,
    String completeClassDeclaration,
    List<String> typeParams,
  ) {
    if ((className?.isEmpty ?? true) == true) {
      throw "Could not determine the `className.`";
    }

    if ((completeClassDeclaration?.isEmpty ?? true) == true) {
      throw "Could not determine the class declaration.";
    }

    if (typeParams.isEmpty || typeParams.length <= 1) {
      throw "You should have more than one type parameter.";
    }
  }
}
