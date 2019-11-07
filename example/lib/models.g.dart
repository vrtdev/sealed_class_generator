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
        ContainerDataExt(this).continued(
          continuationContainerData,
          continuationTextData,
          continuationBoringData,
          continuationFlutterLogoData,
        );
        break;
      case TextData:
        TextDataExt(this).continued(
          continuationContainerData,
          continuationTextData,
          continuationBoringData,
          continuationFlutterLogoData,
        );
        break;
      case BoringData:
        BoringDataExt(this).continued(
          continuationContainerData,
          continuationTextData,
          continuationBoringData,
          continuationFlutterLogoData,
        );
        break;
      case FlutterLogoData:
        FlutterLogoDataExt(this).continued(
          continuationContainerData,
          continuationTextData,
          continuationBoringData,
          continuationFlutterLogoData,
        );
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
        r = ContainerDataExt(this).join(
          joinContainerData,
          joinTextData,
          joinBoringData,
          joinFlutterLogoData,
        );
        break;
      case TextData:
        r = TextDataExt(this).join(
          joinContainerData,
          joinTextData,
          joinBoringData,
          joinFlutterLogoData,
        );
        break;
      case BoringData:
        r = BoringDataExt(this).join(
          joinContainerData,
          joinTextData,
          joinBoringData,
          joinFlutterLogoData,
        );
        break;
      case FlutterLogoData:
        r = FlutterLogoDataExt(this).join(
          joinContainerData,
          joinTextData,
          joinBoringData,
          joinFlutterLogoData,
        );
        break;
    }
    return r;
  }
}

extension ContainerDataExt on ContainerData {
  void continued(
    Function(ContainerData) continuationContainerData,
    Function(TextData) continuationTextData,
    Function(BoringData) continuationBoringData,
    Function(FlutterLogoData) continuationFlutterLogoData,
  ) =>
      continuationContainerData(this);

  R join<R>(
    R Function(ContainerData) joinContainerData,
    R Function(TextData) joinTextData,
    R Function(BoringData) joinBoringData,
    R Function(FlutterLogoData) joinFlutterLogoData,
  ) =>
      joinContainerData(this);
}

extension TextDataExt on TextData {
  void continued(
    Function(ContainerData) continuationContainerData,
    Function(TextData) continuationTextData,
    Function(BoringData) continuationBoringData,
    Function(FlutterLogoData) continuationFlutterLogoData,
  ) =>
      continuationTextData(this);

  R join<R>(
    R Function(ContainerData) joinContainerData,
    R Function(TextData) joinTextData,
    R Function(BoringData) joinBoringData,
    R Function(FlutterLogoData) joinFlutterLogoData,
  ) =>
      joinTextData(this);
}

extension BoringDataExt on BoringData {
  void continued(
    Function(ContainerData) continuationContainerData,
    Function(TextData) continuationTextData,
    Function(BoringData) continuationBoringData,
    Function(FlutterLogoData) continuationFlutterLogoData,
  ) =>
      continuationBoringData(this);

  R join<R>(
    R Function(ContainerData) joinContainerData,
    R Function(TextData) joinTextData,
    R Function(BoringData) joinBoringData,
    R Function(FlutterLogoData) joinFlutterLogoData,
  ) =>
      joinBoringData(this);
}

extension FlutterLogoDataExt on FlutterLogoData {
  void continued(
    Function(ContainerData) continuationContainerData,
    Function(TextData) continuationTextData,
    Function(BoringData) continuationBoringData,
    Function(FlutterLogoData) continuationFlutterLogoData,
  ) =>
      continuationFlutterLogoData(this);

  R join<R>(
    R Function(ContainerData) joinContainerData,
    R Function(TextData) joinTextData,
    R Function(BoringData) joinBoringData,
    R Function(FlutterLogoData) joinFlutterLogoData,
  ) =>
      joinFlutterLogoData(this);
}
