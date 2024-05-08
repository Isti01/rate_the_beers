import 'dart:async';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rate_the_beers/app/rate_the_beers_app.dart';
import 'package:rate_the_beers/util/logging_bloc_observer.dart';

void main() => runZonedGuarded(() async {
      WidgetsFlutterBinding.ensureInitialized();
      await initLogging();
      runApp(const RateTheBeersApp());
    }, (error, stackTrace) {
      log('Uncaught exception in Zone', error: error, stackTrace: stackTrace);
    });

Future<void> initLogging() async {
  PlatformDispatcher.instance.onError = (error, stackTrace) {
    log(
      'Platform error',
      error: error,
      stackTrace: stackTrace,
      name: 'PlatformDispatcher',
    );
    return true;
  };
  if (kDebugMode) {
    Bloc.observer = const LoggingBlocObserver();
  }
}
