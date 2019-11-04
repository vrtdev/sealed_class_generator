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

  R join<R>(
    R Function(DataLoadingCompleteEvent) joinDataLoadingCompleteEvent,
    R Function(ErrorEvent) joinErrorEvent,
  );
}

mixin _$DataLoadingCompleteEvent implements $MyEvent {
  @override
  void continued(
    Function(DataLoadingCompleteEvent) continuationDataLoadingCompleteEvent,
    Function(ErrorEvent) continuationErrorEvent,
  ) =>
      continuationDataLoadingCompleteEvent(this);

  @override
  R join<R>(
    R Function(DataLoadingCompleteEvent) joinDataLoadingCompleteEvent,
    R Function(ErrorEvent) joinErrorEvent,
  ) =>
      joinDataLoadingCompleteEvent(this);
}

mixin _$ErrorEvent implements $MyEvent {
  @override
  void continued(
    Function(DataLoadingCompleteEvent) continuationDataLoadingCompleteEvent,
    Function(ErrorEvent) continuationErrorEvent,
  ) =>
      continuationErrorEvent(this);

  @override
  R join<R>(
    R Function(DataLoadingCompleteEvent) joinDataLoadingCompleteEvent,
    R Function(ErrorEvent) joinErrorEvent,
  ) =>
      joinErrorEvent(this);
}
