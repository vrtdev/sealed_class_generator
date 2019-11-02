// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state.dart';

// **************************************************************************
// SealedGenerator
// **************************************************************************

abstract class $MyState implements MyState<Loading, Data, Failure> {
  void continued(
    Function(Loading) continuationLoading,
    Function(Data) continuationData,
    Function(Failure) continuationFailure,
  );

  R fold<R>(
    R Function(Loading) mapLoading,
    R Function(Data) mapData,
    R Function(Failure) mapFailure,
  );
}

mixin _$Loading {
  void continued(
    Function(Loading) continuationLoading,
    Function(Data) continuationData,
    Function(Failure) continuationFailure,
  ) =>
      continuationLoading(this);

  R fold<R>(
    R Function(Loading) mapLoading,
    R Function(Data) mapData,
    R Function(Failure) mapFailure,
  ) =>
      mapLoading(this);
}
mixin _$Data {
  void continued(
    Function(Loading) continuationLoading,
    Function(Data) continuationData,
    Function(Failure) continuationFailure,
  ) =>
      continuationData(this);

  R fold<R>(
    R Function(Loading) mapLoading,
    R Function(Data) mapData,
    R Function(Failure) mapFailure,
  ) =>
      mapData(this);
}
mixin _$Failure {
  void continued(
    Function(Loading) continuationLoading,
    Function(Data) continuationData,
    Function(Failure) continuationFailure,
  ) =>
      continuationFailure(this);

  R fold<R>(
    R Function(Loading) mapLoading,
    R Function(Data) mapData,
    R Function(Failure) mapFailure,
  ) =>
      mapFailure(this);
}
