This sample shows a more practical use case for sealed classes.  

Imagine having a `List` of different data types, all of these items need their own specific UI.  
We have 4 different data types:
- `ContainerData`
- `TextData`
- `BoringData`
- `FlutterLogoData`

Inside the `build` method of the Widget that contains the `List` we could type check each one of them:

```dart
class MyHomePage extends StatelessWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final repository = Repo();
    final rawData = repository.generateRandomData();

    final widgets = rawData.map((data) {
      Widget widget;
      if (data is ContainerData) {
        widget = MyContainer(data);
      } else if (data is TextData) {
        widget = MyText(data);
      } else if (data is BoringData) {
        widget = MyBoringWidget(data);
      } else if (data is FlutterLogoData) {
        widget = MyFlutterLogo(data);
      }
      return widget;
    }).toList(growable: false);

    return Scaffold(
      appBar: AppBar(title: Text("Sealed Class Examples")),
      body: ListView(children: widgets),
    );
  }
}
```

But what happens if we forget a case? 
Dart will happily compile, but it will crash at run time, because you forgot to add a case.

What if we could catch this error at compilation time?  
That's where this library comes in.  
You tell Dart all the possible cases and it won't let you forget a case.

The above code become.

```dart
class MyHomePage extends StatelessWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final repository = Repo();
    final rawData = repository.generateRandomData();
    final widgets = rawData
        .map(
          (data) => data.fold(
            mapToContainerDataWidget,
            mapToTextDataWidget,
            mapToBoringDataWidget,
            mapToFlutterLogoWidget,
          ),
        )
        .toList(growable: false);

    return Scaffold(
      appBar: AppBar(title: Text("Sealed Class Examples")),
      body: ListView(children: widgets),
    );
  }

  Widget mapToContainerDataWidget(ContainerData data) => MyContainer(data);

  Widget mapToTextDataWidget(TextData data) => MyText(data);

  Widget mapToBoringDataWidget(BoringData data) => MyBoringWidget(data);

  Widget mapToFlutterLogoWidget(FlutterLogoData data) => MyFlutterLogo(data);
}
```

To regenerate run:
 
```bash
flutter packages pub run build_runner build --delete-conflicting-outputs
```


