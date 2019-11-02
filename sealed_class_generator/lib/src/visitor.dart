import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/visitor.dart';

class SealedClassVisitor extends SimpleElementVisitor {
  final List<String> typeParams = [];
  String className = null;
  String completeClassDeclaration = null;

  @override
  visitTypeParameterElement(TypeParameterElement element) =>
      typeParams.add(element.name);

  @override
  visitConstructorElement(ConstructorElement element) {
    completeClassDeclaration = element.type.returnType.toString();
    className = element.type.returnType.name;
  }
}
