import 'dart:ui';

import 'package:sealed_class/sealed_class.dart';

part 'models.g.dart';

@Sealed([
  ContainerData,
  TextData,
  BoringData,
  FlutterLogoData,
])
abstract class Data implements $Data {}

class ContainerData with $ContainerData implements Data {
  final Color color;

  ContainerData(this.color);
}

class TextData with $TextData implements Data {
  final String text;

  TextData(this.text);
}

class BoringData with $BoringData implements Data {}

class FlutterLogoData with $FlutterLogoData implements Data {
  final Duration duration;

  FlutterLogoData(this.duration);
}
