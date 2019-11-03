import 'package:sealed_class_generator/src/transformer.dart';
import 'package:test/test.dart';

void main() {
  group("Type Parameter Transformer", () {
    group("to generated code data", () {
      final generatedCodeData =
          TypeParameterTransformer.toGeneratedCodeData(["A"]).first;
      test("should have the correct generated class name", () {
        expect(generatedCodeData.generatedClassName, "_\$A");
      });

      group("continued function", () {
        test("should have the correct continued function", () {
          expect(generatedCodeData.continuedFunction, "continuationA(this);");
        });

        test("should have the correct continued function declaration", () {
          expect(generatedCodeData.continuedFunctionDeclaration, "Function(A) continuationA");
        });
      });

      group("folding function", () {
        test("should have the correct fold function", () {
          expect(generatedCodeData.foldFunction, "mapA(this);");
        });

        test("should have the correct fold function declaration", () {
          expect(generatedCodeData.foldFunctionDeclaration, "R Function(A) mapA");
        });
      });
    });
  });
}
