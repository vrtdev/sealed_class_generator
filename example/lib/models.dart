import 'dart:ui';

import 'package:sealed_class/sealed_class.dart';

part 'models.g.dart';

@Sealed()
abstract class Data<ContainerData, TextData, BoringData, FlutterLogoData>
    implements $Data {}

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
