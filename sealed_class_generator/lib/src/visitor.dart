import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/visitor.dart';

class SealedClassVisitor extends SimpleElementVisitor {
  String className;

  @override
  visitConstructorElement(ConstructorElement element) =>
      className = element.type.returnType.name;
}
