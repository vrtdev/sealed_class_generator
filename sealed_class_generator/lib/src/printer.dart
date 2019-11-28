import 'common.dart';
import 'transformer.dart';

class PrinterOutput {
  final String sealedClassName;
  final String continuedStatement;
  final String joinStatement;

  PrinterOutput(
    this.sealedClassName,
    this.continuedStatement,
    this.joinStatement,
  );

  @override
  String toString() => (StringBuffer()
        ..writeln("extension ${sealedClassName}Ext on $sealedClassName {")
        ..writeln(continuedStatement)
        ..writeln(joinStatement)
        ..writeln("}"))
      .toString();
}

class Printer {
  static const _continuedMethodName = "continued";
  static const _joinMethodName = "join";

  Printer._();

  static PrinterOutput constructOutput(
    final String className,
    final Iterable<GeneratedCodeData> typeParamData,
  ) {
    String continuedStatement(final Iterable<GeneratedCodeData> typeParamData) {
      String continuedSwitchStatement(
          final Iterable<GeneratedCodeData> typeParamData) {
        final caseBuffer = StringBuffer();
        typeParamData.forEach((it) {
          caseBuffer
            ..writeln("case ${it.type}:")
            ..writeln(it.continuedFunction)
            ..writeln("break;");
        });
        return caseBuffer.toString();
      }

      return (StringBuffer()
            ..write("void $_continuedMethodName(")
            ..writeln()
            ..writeln(typeParamData
                .map((it) => it.continuedFunctionDeclaration)
                .join(",\n"))
            ..writeln(",) {")
            ..writeln("switch (this.runtimeType) {")
            ..writeln(continuedSwitchStatement(typeParamData))
            ..writeln("}")
            ..writeln("}"))
          .toString();
    }

    String joinStatement(final Iterable<GeneratedCodeData> typeParamData) {
      String joinSwitchStatement(
          final Iterable<GeneratedCodeData> typeParamData) {
        final caseBuffer = StringBuffer();
        typeParamData.forEach((it) {
          caseBuffer
            ..writeln("case ${it.type}:")
            ..writeln("r = ${it.joinFunction}")
            ..writeln("break;");
        });
        return caseBuffer.toString();
      }

      return (StringBuffer()
            ..write("$typeParam $_joinMethodName<$typeParam>(")
            ..writeln()
            ..writeln(typeParamData
                .map((it) => it.joinFunctionDeclaration)
                .join(",\n"))
            ..writeln(",) {")
            ..writeln("$typeParam ${typeParam.toLowerCase()};")
            ..writeln("switch (this.runtimeType) {")
            ..writeln(joinSwitchStatement(typeParamData))
            ..writeln("}")
            ..writeln("return ${typeParam.toLowerCase()};")
            ..writeln("}"))
          .toString();
    }

    return PrinterOutput(
      className,
      continuedStatement(typeParamData),
      joinStatement(typeParamData),
    );
  }
}
