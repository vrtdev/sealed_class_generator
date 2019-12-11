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

    group("complete output", () {
      test("should match", () {
        expect(
          printerOutput.toString(),
"""
extension MySealedClassExt on MySealedClass {
void continued(
Function(A) continuationA,
Function(B) continuationB
,) {
if (this is A) {
continuationA(this);
}
if (this is B) {
continuationB(this);
}

}

R join<R>(
R Function(A) joinA,
R Function(B) joinB
,) {
R r;
if (this is A) {
r = joinA(this);
}
if (this is B) {
r = joinB(this);
}

return r;
}

}
""",
        );
      });
    });
  });
}
