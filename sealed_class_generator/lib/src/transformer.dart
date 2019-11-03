import 'common.dart';

class GeneratedCodeData {
  static const continuedMethodName = "continuation";
  static const mapMethodName = "map";
  
  final String generatedClassName;

  final String continuedFunction;
  final String continuedFunctionDeclaration;

  final String foldFunction;
  final String foldFunctionDeclaration;

  GeneratedCodeData(final String type)
      : generatedClassName = "_\$$type",
        continuedFunction = "$continuedMethodName$type(this);",
        continuedFunctionDeclaration =
            "Function($type) $continuedMethodName$type",
        foldFunction = "$mapMethodName$type(this);",
        foldFunctionDeclaration =
            "$typeParam Function($type) $mapMethodName$type";
}

class TypeParameterTransformer {
  TypeParameterTransformer._();

  static List<GeneratedCodeData> toGeneratedCodeData(final List<String> typeParameters) =>
      typeParameters.map((it) => GeneratedCodeData(it)).toList(growable: false);
}
