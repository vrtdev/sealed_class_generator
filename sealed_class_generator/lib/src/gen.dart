import 'dart:async';

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:sealed_class/sealed_class.dart';
import 'package:source_gen/source_gen.dart';

import 'checker.dart';
import 'transformer.dart';
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

    Checker.checkInputValidity(visitor.className, visitor.typeParams);

    final typeParameterData =
        TypeParameterTransformer.toGeneratedCodeData(visitor.typeParams);
    final printerOutput =
        Printer.constructOutput(visitor.className, typeParameterData);

    return printerOutput.toString();
  }
}
