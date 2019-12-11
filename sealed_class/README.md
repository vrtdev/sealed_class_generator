# Sealed Class Generator

sealed_class: [![pub package](https://img.shields.io/pub/v/sealed_class.svg)](https://pub.dartlang.org/packages/sealed_class)  
sealed_class_generator: [![pub package](https://img.shields.io/pub/v/sealed_class_generator.svg)](https://pub.dartlang.org/packages/sealed_class_generator)

Fix Dart's lack of a sealed class.  
Inspired by [Kotlin's implementation](https://kotlinlang.org/docs/reference/sealed-classes.html) and by [Sealed Unions](https://pub.dev/packages/sealed_unions).  
With this lib you can generate an unlimited amount of sealed subclasses.

## Installation

```yaml
dependencies:
  sealed_class: 3.0.0

dev_dependencies:
  sealed_class_generator: 3.0.0
  build_runner: X.X.X
```

## How to use:

A complete example is found in the [example](https://github.com/timrijckaert/sealed_class_generator/tree/master/example).  

Define your `Sealed` class by annotating it with `@Sealed()`  

```dart
part 'yourfilename.g.dart';

@Sealed()
abstract class Result{}
```

Add the subclasses to the annotation.   

```dart
part 'yourfilename.g.dart';

@Sealed([Failure, Success])
abstract class Result{}
```

Your subclasses should implement your sealed class.

```dart
@Sealed([Failure, Success])
abstract class Result {}

class Failure implements Result {
  final String errorMessage;

  Failure(this.errorMessage);
}

class Success implements Result {
  final String data;

  Success(this.data);
}
```

The complete file should now look like this:  

````dart
import 'package:sealed_class/sealed_class.dart';

part 'yourfilename.g.dart';

@Sealed([Failure, Success])
abstract class Result {}

class Failure implements Result {
  final String errorMessage;

  Failure(this.errorMessage);
}

class Success implements Result {
  final String data;

  Success(this.data);
}
````

To make it compile run the following command in the terminal:  

```shell script
flutter packages pub run build_runner build --delete-conflicting-outputs
```

You can do:  

```dart
void main() {
  final someResult = Success("Woohoo Sealed classes in Dart");
  someResult.continued(
    (failure) {
      print("Oh no it failed with errorMessage: ${failure.errorMessage}");
    },
    (success) {
      print(success.data);
    },
  );

  //Or if you want to reduce it to another value use `join`
  final someOtherResult = Failure("Some Error Message");
  final mapResult = someOtherResult.join(
    (failure) => failure.errorMessage,
    (success) => success.data,
  );
  print(mapResult);
}
```
