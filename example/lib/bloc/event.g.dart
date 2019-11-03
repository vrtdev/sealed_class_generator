// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// SealedGenerator
// **************************************************************************

mixin $MyEvent {
  void continued(
    Function(DataLoadingCompleteEvent) continuationDataLoadingCompleteEvent,
    Function(ErrorEvent) continuationErrorEvent,
  );

  R fold<R>(
    R Function(DataLoadingCompleteEvent) mapDataLoadingCompleteEvent,
    R Function(ErrorEvent) mapErrorEvent,
  );
}

mixin _$DataLoadingCompleteEvent implements $MyEvent {
  void continued(
    Function(DataLoadingCompleteEvent) continuationDataLoadingCompleteEvent,
    Function(ErrorEvent) continuationErrorEvent,
  ) =>
      continuationDataLoadingCompleteEvent(this);

  R fold<R>(
    R Function(DataLoadingCompleteEvent) mapDataLoadingCompleteEvent,
    R Function(ErrorEvent) mapErrorEvent,
  ) =>
      mapDataLoadingCompleteEvent(this);
}

mixin _$ErrorEvent implements $MyEvent {
  void continued(
    Function(DataLoadingCompleteEvent) continuationDataLoadingCompleteEvent,
    Function(ErrorEvent) continuationErrorEvent,
  ) =>
      continuationErrorEvent(this);

  R fold<R>(
    R Function(DataLoadingCompleteEvent) mapDataLoadingCompleteEvent,
    R Function(ErrorEvent) mapErrorEvent,
  ) =>
      mapErrorEvent(this);
}
