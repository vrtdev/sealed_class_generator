# Sealed Class Generator

Fix Dart's lack of a sealed class.  
Inspired by [Kotlin's implementation](https://kotlinlang.org/docs/reference/sealed-classes.html) and by [Sealed Unions](https://pub.dev/packages/sealed_unions).  
With this lib you can generate an unlimited amount of sealed subclasses.

## Installation

```yaml
dependencies:
  sealed_class: X.X.X

dev_dependencies:
  sealed_class_generator: X.X.X
  build_runner: X.X.X
```

## How to use:

A complete example is found in the `example folder`.  

Define your `Sealed` class by annotating it with `@Sealed()`  

```dart
part 'yourfilename.g.dart';

@Sealed()
abstract class Result{}
```

Add the subclasses as type parameters  

```dart
part 'yourfilename.g.dart';

@Sealed()
abstract class Result<Failure, Success>{}
```

Let your subclasses mixin the generated file.  
Let your sealed class mixin the generate mixin.

```dart
@Sealed()
abstract class Result<Failure, Success> implements $Result {}

class Failure with _$Failure implements Result {
  final String errorMessage;

  Failure(this.errorMessage);
}

class Success with _$Success implements Result {
  final String data;

  Success(this.data);
}
```

The complete file should now look like this:  

````dart
import 'package:sealed_class/sealed_class.dart';

part 'yourfilename.g.dart';

@Sealed()
abstract class Result<Failure, Success> implements $Result {}

class Failure with _$Failure implements Result {
  final String errorMessage;

  Failure(this.errorMessage);
}

class Success with _$Success implements Result {
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

  //Or if you want to reduce it to another value use `fold`
  final someOtherResult = Failure("Some Error Message");
  final mapResult = someOtherResult.fold(
    (failure) => failure.errorMessage,
    (success) => success.data,
  );
  print(mapResult);
}
```
