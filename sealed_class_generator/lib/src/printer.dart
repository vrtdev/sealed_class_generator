import 'common.dart';
import 'transformer.dart';

class PrinterOutput {
  final String sealedClassDeclaration;
  final Iterable<String> mixinDeclarations;

  PrinterOutput(this.sealedClassDeclaration, this.mixinDeclarations);

  @override
  String toString() => (StringBuffer()
        ..write(sealedClassDeclaration)
        ..writeln()
        ..write(mixinDeclarations.join("\n")))
      .toString();
}

class Printer {
  static const _continuedMethodName = "continued";
  static const _foldMethodName = "fold";

  Printer._();

  static PrinterOutput printOutput(
    final String className,
    final Iterable<GeneratedCodeData> typeParamData,
  ) {
    String generateCompleteContinuedMethodDeclaration(
        final Iterable<GeneratedCodeData> parseData) {
      final continuedFunctionDeclarations =
          parseData.map((it) => "${it.continuedFunctionDeclaration}");

      return (StringBuffer()
            ..writeln("void $_continuedMethodName(")
            ..writeln(continuedFunctionDeclarations.join(","))
            ..writeln(",")
            ..writeln(")"))
          .toString();
    }

    String generateCompleteFoldMethodDeclaration(
        final Iterable<GeneratedCodeData> parseData) {
      final foldFunctionDeclarations =
          parseData.map((it) => "${it.foldFunctionDeclaration}");

      return (StringBuffer()
            ..writeln("$typeParam $_foldMethodName<$typeParam>(")
            ..writeln(foldFunctionDeclarations.join(","))
            ..writeln(",")
            ..writeln(")"))
          .toString();
    }

    String generatedClassName(final String className) => "\$${className}";

    String generateSealedClassMixin(
        final String className, final Iterable<GeneratedCodeData> parseData) {
      return (StringBuffer()
            ..writeln("mixin ${generatedClassName(className)}")
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
        final String className, final Iterable<GeneratedCodeData> parseData) sync* {
      for (final data in parseData) {
        final output = StringBuffer()
          ..writeln(
              "mixin ${data.generatedClassName} implements ${generatedClassName(className)}")
          ..writeln("{")
          ..writeln(generateCompleteContinuedMethodDeclaration(parseData))
          ..write("=>")
          ..writeln(data.continuedFunction)
          ..writeln("\n")
          ..writeln(generateCompleteFoldMethodDeclaration(parseData))
          ..write("=>")
          ..writeln(data.foldFunction)
          ..writeln("}");

        yield output.toString();
      }
    }

    final sealedClassDeclaration = generateSealedClassMixin(
      className,
      typeParamData,
    );

    final mixinDeclarations = generateMixinDeclarations(
      className,
      typeParamData,
    );

    return PrinterOutput(sealedClassDeclaration, mixinDeclarations);
  }
}
