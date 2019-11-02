import 'common.dart';

class ParsedData {
  static const continuedMethodName = "continuation";
  static const mapMethodName = "map";

  final String type;
  final String mixinName;

  ParsedData(this.type) : mixinName = "_\$$type";

  String toContinuedFunction() => "$continuedMethodName$type(this);";

  String toContinuedFunctionDeclaration() =>
      'Function($type) $continuedMethodName$type';

  String toFoldFunction() => "$mapMethodName$type(this);";

  String toFoldFunctionDeclaration() =>
      '$typeParam Function($type) $mapMethodName$type';
}

class TypeParameterParser {
  TypeParameterParser._();

  static Iterable<ParsedData> parse(final List<String> typeParameters) sync* {
    for (final type in typeParameters) {
      yield ParsedData(type);
    }
  }
}
