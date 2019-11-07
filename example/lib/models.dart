import 'dart:ui';

import 'package:sealed_class/sealed_class.dart';

part 'models.g.dart';

@Sealed()
abstract class Data<ContainerData, TextData, BoringData, FlutterLogoData> {}

class ContainerData implements Data {
  final Color color;

  ContainerData(this.color);
}

class TextData implements Data {
  final String text;

  TextData(this.text);
}

class BoringData implements Data {}

class FlutterLogoData implements Data {
  final Duration duration;

  FlutterLogoData(this.duration);
}
