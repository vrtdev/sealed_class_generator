import 'dart:async';

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:sealed_class/sealed_class.dart';
import 'package:source_gen/source_gen.dart';

import 'checker.dart';
import 'parser.dart';
import 'printer.dart';
import 'visitor.dart';

class SealedGenerator extends GeneratorForAnnotation<Sealed> {
  @override
  FutureOr<String> generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    final visitor = SealedClassVisitor();
    element.visitChildren(visitor);

    Checker.checkInputValidity(
      visitor.className,
      visitor.completeClassDeclaration,
      visitor.typeParams,
    );

    final typeParameterData = TypeParameterParser.parse(visitor.typeParams);
    final printerOutput = Printer.printOutput(
      visitor.className,
      visitor.completeClassDeclaration,
      typeParameterData,
    );

    return printerOutput.toString();
  }
}
