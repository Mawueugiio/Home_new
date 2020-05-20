import 'package:auto_route/auto_route.dart';
import 'package:beta_project/core/globals.dart';
import 'package:beta_project/core/guards.dart';
import 'package:beta_project/core/routes.gr.dart';
import 'package:beta_project/core/themes/theme.dart';
import 'package:beta_project/presentation/bloc/prefs/prefs_bloc.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Entry point of the application
class HomeSysApp extends StatefulWidget {
  @override
  _HomeSysAppState createState() => _HomeSysAppState();
}

class _HomeSysAppState extends State<HomeSysApp> {
  FirebaseAnalytics analytics = FirebaseAnalytics();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: PrefsBloc()),
      ],
      child: MaterialApp(
        title: kAppNameShort,
        navigatorObservers: [
          FirebaseAnalyticsObserver(analytics: analytics),
        ],
        locale: Localizations.localeOf(context, nullOk: true),
        debugShowCheckedModeBanner: false,
        // FIXME: You can add your own theme in this class
        theme: KThemes.lightTheme,
        darkTheme: KThemes.darkTheme,
        builder: ExtendedNavigator<Router>(
          router: Router(),
          guards: [AuthGuard()],
        ),
      ),
    );
  }
}
