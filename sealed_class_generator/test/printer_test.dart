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

R join<R>(
R Function(A) joinA,R Function(B) joinB
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
mixin \$A implements \$MySealedClass
{
@override
void continued(
Function(A) continuationA,Function(B) continuationB
,
)

=>continuationA(this);


@override
R join<R>(
R Function(A) joinA,R Function(B) joinB
,
)

=>joinA(this);
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
mixin \$B implements \$MySealedClass
{
@override
void continued(
Function(A) continuationA,Function(B) continuationB
,
)

=>continuationB(this);


@override
R join<R>(
R Function(A) joinA,R Function(B) joinB
,
)

=>joinB(this);
}
""",
          );
        });
      });
    });
  });
}
