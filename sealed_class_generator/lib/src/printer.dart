import 'parser.dart';

class PrinterOutput {
  final String sealedClassDeclaration;
  final Iterable<String> mixinDeclarations;

  PrinterOutput(this.sealedClassDeclaration, this.mixinDeclarations);

  @override
  String toString() => (StringBuffer()
        ..write(sealedClassDeclaration)
        ..writeln()
        ..write(mixinDeclarations.join()))
      .toString();
}

class Printer {
  static const _continuedMethodName = "continued";
  static const _foldMethodName = "fold";

  Printer._();

  static PrinterOutput printOutput(
    final String className,
    final String completeClassDeclaration,
    final Iterable<ParsedData> typeParamData,
  ) {
    String generateCompleteContinuedMethodDeclaration(
        final Iterable<ParsedData> parseData) {
      final continuedFunctionDeclarations =
          parseData.map((it) => "${it.toContinuedFunctionDeclaration()}");

      return (StringBuffer()
            ..writeln("void $_continuedMethodName(")
            ..writeln(continuedFunctionDeclarations.join(","))
            ..writeln(",")
            ..writeln(")"))
          .toString();
    }

    String generateCompleteFoldMethodDeclaration(
        final Iterable<ParsedData> parseData) {
      final foldFunctionDeclarations =
          parseData.map((it) => "${it.toFoldFunctionDeclaration()}");

      return (StringBuffer()
            ..writeln("R $_foldMethodName<R>(")
            ..writeln(foldFunctionDeclarations.join(","))
            ..writeln(",")
            ..writeln(")"))
          .toString();
    }

    String generateSealedClassDeclaration(
        final String className,
        final String completeClassDeclaration,
        final Iterable<ParsedData> parseData) {
      return (StringBuffer()
            ..writeln(
                "abstract class \$${className} implements ${completeClassDeclaration}")
            ..writeln("{")
            ..writeln(generateCompleteContinuedMethodDeclaration(parseData))
            ..write(";")
            ..writeln("\n")
            ..writeln(generateCompleteFoldMethodDeclaration(parseData))
            ..write(";")
            ..writeln("}"))
          .toString();
    }

    Iterable<String> generateMixinDeclarations(
        final Iterable<ParsedData> parseData) sync* {
      for (final data in parseData) {
        final output = StringBuffer()
          ..writeln("mixin ${data.mixinName}")
          ..writeln("{")
          ..writeln(generateCompleteContinuedMethodDeclaration(parseData))
          ..write("=>")
          ..writeln(data.toContinuedFunction())
          ..writeln("\n")
          ..writeln(generateCompleteFoldMethodDeclaration(parseData))
          ..write("=>")
          ..writeln(data.toFoldFunction())
          ..writeln("}");

        yield output.toString();
      }
    }

    final sealedClassDeclaration = generateSealedClassDeclaration(
      className,
      completeClassDeclaration,
      typeParamData,
    );

    final mixinDeclarations = generateMixinDeclarations(typeParamData);
    return PrinterOutput(sealedClassDeclaration, mixinDeclarations);
  }
}
