// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

// import 'package:creatu_exam/l10n/l10n.dart';
import 'package:creatu_exam/core/di/dependency_injections.dart';
import 'package:creatu_exam/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:creatu_exam/features/auth/presentation/bloc/social_auth/social_auth_bloc.dart';
import 'package:creatu_exam/features/auth/presentation/pages/login.dart';
import 'package:creatu_exam/features/exams/presentation/pages/dashboard_page.dart';
import 'package:creatu_exam/widgets/custom_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<AuthBloc>()
          ..add(const LoginStatusEvent())
          ,
        ),
        BlocProvider(
          create: (context) => getIt<RegisterBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<SocialAuthBloc>(),
        ),
      ],
      child: ScreenUtilInit(
        builder: (context, child) {
          return MaterialApp(
            theme: ThemeData(
              appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
              colorScheme: ColorScheme.fromSwatch(
                accentColor: const Color(0xFF13B9FF),
              ),
              textTheme: TextTheme(
              ),
              
            ),
            // localizationsDelegates: AppLocalizations.localizationsDelegates,
            // supportedLocales: AppLocalizations.supportedLocales,
            home: BlocListener<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is AuthSuccessState) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DashboardPage(),
                    ),
                  );
                } else if (state is AuthErrorState) {
                  showDialog(
                    context: context,
                    builder: (__) => CustomDialogBox(
                      message: state.error.message ?? '',
                      statusCode: state.error.statusCode,
                    ),
                  );
                } else if (state is UnAuthenticatedState) {}
              },
              child: const LoginPage(),
            ),
          );
        },
      ),
    );
  }
}
