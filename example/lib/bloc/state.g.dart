// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state.dart';

// **************************************************************************
// SealedGenerator
// **************************************************************************

mixin $MyState {
  void continued(
    Function(Loading) continuationLoading,
    Function(Data) continuationData,
    Function(Failure) continuationFailure,
  );

  R join<R>(
    R Function(Loading) joinLoading,
    R Function(Data) joinData,
    R Function(Failure) joinFailure,
  );
}

mixin _$Loading implements $MyState {
  @override
  void continued(
    Function(Loading) continuationLoading,
    Function(Data) continuationData,
    Function(Failure) continuationFailure,
  ) =>
      continuationLoading(this);

  @override
  R join<R>(
    R Function(Loading) joinLoading,
    R Function(Data) joinData,
    R Function(Failure) joinFailure,
  ) =>
      joinLoading(this);
}

mixin _$Data implements $MyState {
  @override
  void continued(
    Function(Loading) continuationLoading,
    Function(Data) continuationData,
    Function(Failure) continuationFailure,
  ) =>
      continuationData(this);

  @override
  R join<R>(
    R Function(Loading) joinLoading,
    R Function(Data) joinData,
    R Function(Failure) joinFailure,
  ) =>
      joinData(this);
}

mixin _$Failure implements $MyState {
  @override
  void continued(
    Function(Loading) continuationLoading,
    Function(Data) continuationData,
    Function(Failure) continuationFailure,
  ) =>
      continuationFailure(this);

  @override
  R join<R>(
    R Function(Loading) joinLoading,
    R Function(Data) joinData,
    R Function(Failure) joinFailure,
  ) =>
      joinFailure(this);
}
