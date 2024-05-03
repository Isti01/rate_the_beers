import 'dart:developer';

import 'package:bloc/bloc.dart';

class LoggingBlocObserver extends BlocObserver {
  const LoggingBlocObserver();

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    log(
      '[Event]: $event',
      name: bloc.runtimeType.toString(),
    );
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    log(
      '[Change currentState]: ${change.currentState}',
      name: bloc.runtimeType.toString(),
    );
    log(
      '[Change nextState]: ${change.nextState}',
      name: bloc.runtimeType.toString(),
    );
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    log(
      'An error occurred',
      name: bloc.runtimeType.toString(),
      error: error,
      stackTrace: stackTrace,
    );
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    log(
      '[Created with state]: ${bloc.state}',
      name: bloc.runtimeType.toString(),
    );
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    log('[Closed]', name: bloc.runtimeType.toString());
  }
}
