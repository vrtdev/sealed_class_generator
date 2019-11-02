import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'bloc/bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        RepositoryProvider(builder: (_) => Repo()),
        BlocProvider(
            builder: (context) => MyBloc(RepositoryProvider.of(context)))
      ],
      child: MaterialApp(
        title: 'A practical use case of sealed classes',
        theme: ThemeData.dark(),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocBuilder<MyBloc, $MyState>(
        builder: (context, state) => Scaffold(
          appBar: AppBar(title: Text("Sealed Class Examples")),
          body: state.fold(mapLoading, mapData, mapFailure),
        ),
      );

  Widget mapLoading(Loading loading) =>
      Center(child: CircularProgressIndicator());

  Widget mapData(Data data) {
    Widget mapToContainerDataWidget(ContainerData data) => MyContainer(data);

    Widget mapToTextDataWidget(TextData data) => MyText(data);

    Widget mapToBoringDataWidget(BoringData data) => MyBoringWidget(data);

    Widget mapToFlutterLogoWidget(FlutterLogoData data) => MyFlutterLogo(data);

    return ListView(
        children: data.data
            .map(
              (data) => data.fold(
                mapToContainerDataWidget,
                mapToTextDataWidget,
                mapToBoringDataWidget,
                mapToFlutterLogoWidget,
              ),
            )
            .toList(growable: false));
  }

  Widget mapFailure(Failure failure) => Center(child: Text(failure.errorMsg));
}

//<editor-fold desc="Helper Widgets">
class MyContainer extends StatelessWidget {
  final ContainerData data;

  MyContainer(this.data, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      Container(height: 50, color: data.color);
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
  Widget build(BuildContext context) =>
      SizedBox(child: Placeholder(), height: 50);
}

class MyFlutterLogo extends StatelessWidget {
  final FlutterLogoData data;

  const MyFlutterLogo(this.data, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => FlutterLogo(duration: data.duration);
}
//</editor-fold>
