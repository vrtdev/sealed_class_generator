import 'dart:convert';
import 'dart:io';

final versionRegex = RegExp(r"version: (.*)");

/// dart tool/prepare_push_release.dart
void main() {
  print("Enter your new version:");
  final newVersion = stdin.readLineSync(encoding: Utf8Codec());
  print("Enter the new change log");
  final newChangeLog =
      stdin.readLineSync(encoding: Utf8Codec(), retainNewlines: true);

  final currentVersion = _currentVersion();

  _updateChangeLog(newVersion, newChangeLog);
  _updateReadme(currentVersion, newVersion);
  _updatePubspec(currentVersion, newVersion);
}

void _updatePubspec(final String currentVersion, final String newVersion) {
  final sealedClassPubSpec = File("sealed_class/pubspec.yaml");
  final sealedClassPubSpecContents = sealedClassPubSpec.readAsStringSync();

  sealedClassPubSpec.writeAsStringSync(
    sealedClassPubSpecContents.replaceAll(
      currentVersion,
      newVersion,
    ),
  );

  final sealedClassGeneratorPubSpec =
      File("sealed_class_generator/pubspec.yaml");
  final sealedClassGeneratorPubSpecContents =
      sealedClassGeneratorPubSpec.readAsStringSync();

  sealedClassGeneratorPubSpec.writeAsStringSync(
    sealedClassGeneratorPubSpecContents.replaceAll(
      currentVersion,
      newVersion,
    ),
  );
}

String _currentVersion() {
  final currentVersion =
      File("sealed_class_generator/pubspec.yaml").readAsStringSync();
  return versionRegex.firstMatch(currentVersion).group(1);
}

void _updateReadme(final String currentVersion, final String newVersion) {
  final readme = File("README.md");
  final currentContents = readme.readAsStringSync();
  readme.writeAsStringSync(
      currentContents.replaceAll(currentVersion, newVersion));
}

void _updateChangeLog(final String newVersion, final String newChangeLog) {
  final file = File("CHANGELOG.md");
  final currentContents = file.readAsStringSync();
  file.writeAsStringSync((StringBuffer()
        ..writeln("# $newVersion")
        ..writeln("* ${newChangeLog}")
        ..write(currentContents))
      .toString()
      .trim());
}
