import 'package:sealed_class/sealed_class.dart';

import 'models.dart';

part 'state.g.dart';

@Sealed()
abstract class MyState<Loading, Data, Failure> implements $MyState {}

class Loading with _$Loading implements MyState {}

class Data with _$Data implements MyState {
  final List<$WidgetData> data;

  Data(this.data);
}

class Failure with _$Failure implements MyState {
  final String errorMsg;

  Failure(this.errorMsg);
}
