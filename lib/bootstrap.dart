// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:creatu_exam/core/di/dependency_injections.dart';
import 'package:creatu_exam/features/auth/data/models/user_hive_model.dart';
import 'package:creatu_exam/firebase_options.dart';
import 'package:creatu_exam/res/app_string.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    log('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  Bloc.observer = AppBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  //hive_flutter
  // await Hive.initFlutter();
  // Hive
  //   ..registerAdapter<UserHiveModel>(UserHiveModelAdapter())
  //   ..registerAdapter<RoleHiveModel>(RoleHiveModelAdapter())
  //   ..registerAdapter<PivotHiveModel>(PivotHiveModelAdapter());
  // await Hive.openBox<UserHiveModel>(AppString.userBoxName);
  //di
  await setup();

  await runZonedGuarded(
    () async => runApp(await builder()),
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}
