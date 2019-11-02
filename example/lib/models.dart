import 'dart:ui';

import 'package:sealed_class/sealed_class.dart';

part 'models.g.dart';

@Sealed()
class Data<ContainerData, TextData, BoringData, FlutterLogoData> {}

class ContainerData with _$ContainerData implements $Data {
  final Color color;

  ContainerData(this.color);
}

class TextData with _$TextData implements $Data {
  final String text;

  TextData(this.text);
}

class BoringData with _$BoringData implements $Data {}

class FlutterLogoData with _$FlutterLogoData implements $Data {
  final Duration duration;

  FlutterLogoData(this.duration);
}