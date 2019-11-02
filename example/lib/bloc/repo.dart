import 'dart:math';
import 'dart:ui';

import 'models.dart';

class Repo {
  static Random _random = Random();
  static const _chars = "abcdefghijklmnopqrstuvwxyz";

  List<WidgetData> generateRandomData({final int amountOfData = 100}) =>
      List.generate(amountOfData, (_) => _random.nextInt(4)).map((it) {
        WidgetData d;
        switch (it) {
          case 0:
            d = ContainerData(_randomColor());
            break;
          case 1:
            d = TextData(_randomString());
            break;
          case 2:
            d = BoringData();
            break;
          case 3:
            d = FlutterLogoData(Duration(seconds: 3));
            break;
        }
        return d;
      }).toList(growable: false);

  Color _randomColor() =>
      Color((_random.nextDouble() * 0xFFFFFF).toInt() << 0).withOpacity(1.0);

  String _randomString({final int strLength = 100}) {
    String result = "";
    for (var i = 0; i < strLength; i++) {
      result += _chars[_random.nextInt(_chars.length)];
    }
    return result;
  }
}
