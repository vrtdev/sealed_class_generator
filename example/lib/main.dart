import 'package:example/repo.dart';
import 'package:flutter/material.dart';

import 'models.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'A practical use case of sealed classes',
      theme: ThemeData.dark(),
      home: MyHomePage(),
    );
  }
}

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

//<editor-fold desc="Helper Widgets">
class MyContainer extends StatelessWidget {
  final ContainerData data;

  MyContainer(this.data, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(color: data.color);
}

class MyText extends StatelessWidget {
  final TextData data;

  const MyText(this.data, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Text(data.text);
}

class MyBoringWidget extends StatelessWidget {
  final BoringData data;

  const MyBoringWidget(this.data, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Placeholder();
}

class MyFlutterLogo extends StatelessWidget {
  final FlutterLogoData data;

  const MyFlutterLogo(this.data, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => FlutterLogo(duration: data.duration);
}
//</editor-fold>
