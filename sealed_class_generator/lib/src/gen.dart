import 'dart:async';

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:sealed_class/sealed_class.dart';
import 'package:source_gen/source_gen.dart';

import 'checker.dart';
import 'printer.dart';
import 'transformer.dart';
import 'visitor.dart';

class SealedGenerator extends GeneratorForAnnotation<Sealed> {
  @override
  FutureOr<String> generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    final typeParams = annotation.objectValue
        .getField("types")
        .toListValue()
        .map((dartObj) => dartObj.toTypeValue())
        .map((type) => type.name)
        .toList();

    final visitor = SealedClassVisitor();
    element.visitChildren(visitor);

    Checker.checkInputValidity(visitor.className, typeParams);

    final typeParameterData =
        TypeParameterTransformer.toGeneratedCodeData(typeParams);
    final printerOutput =
        Printer.constructOutput(visitor.className, typeParameterData);

    return printerOutput.toString();
  }
}
