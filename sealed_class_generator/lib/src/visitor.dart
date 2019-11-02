import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/visitor.dart';

class SealedClassVisitor extends SimpleElementVisitor {
  final List<String> typeParams = [];
  String className = null;

  @override
  visitTypeParameterElement(TypeParameterElement element) =>
      typeParams.add(element.name);

  @override
  visitConstructorElement(ConstructorElement element) =>
      className = element.type.returnType.name;
}
