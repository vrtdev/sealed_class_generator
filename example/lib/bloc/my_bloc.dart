import 'package:bloc/bloc.dart';

import 'event.dart';
import 'repo.dart';
import 'state.dart';

class MyBloc extends Bloc<MyEvent, MyState> {
  final Repo repo;

  MyBloc(this.repo) {
    doSomeLangRunningWork();
  }

  @override
  MyState get initialState => Loading();

  @override
  Stream<MyState> mapEventToState(MyEvent event) =>
      event.fold(mapDataLoadingCompleteEvent, mapErrorEvent);

  Stream<MyState> mapDataLoadingCompleteEvent(
      final DataLoadingCompleteEvent event) async* {
    yield Data(event.data);
  }

  Stream<MyState> mapErrorEvent(final ErrorEvent errorEvent) async* {
    yield Failure(errorEvent.errorMsg);
  }

  Future<void> doSomeLangRunningWork() async {
    await Future.delayed(Duration(seconds: 5));
    add(DataLoadingCompleteEvent(repo.generateRandomData()));
    await Future.delayed(Duration(seconds: 10));
    add(ErrorEvent("Something terrible happened!"));
  }
}
