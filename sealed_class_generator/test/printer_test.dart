import 'package:sealed_class_generator/src/printer.dart';
import 'package:sealed_class_generator/src/transformer.dart';
import 'package:test/test.dart';

void main() {
  group("Printer", () {
    final printerOutput = Printer.constructOutput(
      "MySealedClass",
      [
        GeneratedCodeData("A"),
        GeneratedCodeData("B"),
      ],
    );

    group("Sealed Class Code Gen", () {
      final generatedSealedClassDeclaration =
          printerOutput.sealedClassDeclaration;
      test("should match output", () {
        expect(
          generatedSealedClassDeclaration,
          """
mixin \$MySealedClass
{
void continued(
Function(A) continuationA,Function(B) continuationB
,
)

;

R fold<R>(
R Function(A) mapA,R Function(B) mapB
,
)

;}
""",
        );
      });
    });

    group("Mixin Code Gen", () {
      final generatedMixinDeclarations =
          printerOutput.mixinDeclarations.toList(growable: false);
      group("Type Parameter A", () {
        final generatedMixinDeclarationA = generatedMixinDeclarations[0];
        test("should match output", () {
          expect(
            generatedMixinDeclarationA,
            """
mixin _\$A implements \$MySealedClass
{
void continued(
Function(A) continuationA,Function(B) continuationB
,
)

=>continuationA(this);


R fold<R>(
R Function(A) mapA,R Function(B) mapB
,
)

=>mapA(this);
}
""",
          );
        });
      });

      group("Type Parameter B", () {
        final generatedMixinDeclarationA = generatedMixinDeclarations[1];
        test("should match output", () {
          expect(
            generatedMixinDeclarationA,
            """
mixin _\$B implements \$MySealedClass
{
void continued(
Function(A) continuationA,Function(B) continuationB
,
)

=>continuationB(this);


R fold<R>(
R Function(A) mapA,R Function(B) mapB
,
)

=>mapB(this);
}
""",
          );
        });
      });
    });
  });
}
