import 'package:build/build.dart';
import 'package:sealed_class_generator/src/gen.dart';
import 'package:source_gen/source_gen.dart';

Builder sealedClassBuilder(BuilderOptions options) =>
    SharedPartBuilder([SealedGenerator()], 'sealed_gen');
