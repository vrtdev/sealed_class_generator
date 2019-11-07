// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// SealedGenerator
// **************************************************************************

extension DataExt on Data {
  void continued(
    Function(ContainerData) continuationContainerData,
    Function(TextData) continuationTextData,
    Function(BoringData) continuationBoringData,
    Function(FlutterLogoData) continuationFlutterLogoData,
  ) {
    switch (this.runtimeType) {
      case ContainerData:
        continuationContainerData(this);
        break;
      case TextData:
        continuationTextData(this);
        break;
      case BoringData:
        continuationBoringData(this);
        break;
      case FlutterLogoData:
        continuationFlutterLogoData(this);
        break;
    }
  }

  R join<R>(
    R Function(ContainerData) joinContainerData,
    R Function(TextData) joinTextData,
    R Function(BoringData) joinBoringData,
    R Function(FlutterLogoData) joinFlutterLogoData,
  ) {
    R r;
    switch (this.runtimeType) {
      case ContainerData:
        r = joinContainerData(this);
        break;
      case TextData:
        r = joinTextData(this);
        break;
      case BoringData:
        r = joinBoringData(this);
        break;
      case FlutterLogoData:
        r = joinFlutterLogoData(this);
        break;
    }
    return r;
  }
}
