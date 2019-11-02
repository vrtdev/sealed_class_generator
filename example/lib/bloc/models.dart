import 'dart:ui';

import 'package:sealed_class/sealed_class.dart';

part 'models.g.dart';

@Sealed()
class WidgetData<ContainerData, TextData, BoringData, FlutterLogoData> {}

class ContainerData with _$ContainerData implements $WidgetData {
  final Color color;

  ContainerData(this.color);
}

class TextData with _$TextData implements $WidgetData {
  final String text;

  TextData(this.text);
}

class BoringData with _$BoringData implements $WidgetData {}

class FlutterLogoData with _$FlutterLogoData implements $WidgetData {
  final Duration duration;

  FlutterLogoData(this.duration);
}
