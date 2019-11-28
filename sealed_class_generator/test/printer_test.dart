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

    group("sealed class generator", () {
      test("sealed class name", () {
        expect(printerOutput.sealedClassName, "MySealedClass");
      });

      test("continued", () {
        expect(printerOutput.continuedStatement, """
void continued(
Function(A) continuationA,
Function(B) continuationB
,) {
switch (this.runtimeType) {
case A:
continuationA(this);
break;
case B:
continuationB(this);
break;

}
}
""");
      });

      test("join", () {
        expect(printerOutput.joinStatement, """
R join<R>(
R Function(A) joinA,
R Function(B) joinB
,) {
R r;
switch (this.runtimeType) {
case A:
r = joinA(this);
break;
case B:
r = joinB(this);
break;

}
return r;
}
""");
      });
    });
  });
}
