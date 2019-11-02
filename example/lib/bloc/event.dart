import 'package:sealed_class/sealed_class.dart';

import 'models.dart';

part 'event.g.dart';

@Sealed()
abstract class MyEvent<DataLoadingCompleteEvent, ErrorEvent>
    implements $MyEvent {}

class DataLoadingCompleteEvent
    with _$DataLoadingCompleteEvent
    implements MyEvent {
  final List<WidgetData> data;

  DataLoadingCompleteEvent(this.data);
}

class ErrorEvent with _$ErrorEvent implements MyEvent {
  final String errorMsg;

  ErrorEvent(this.errorMsg);
}
