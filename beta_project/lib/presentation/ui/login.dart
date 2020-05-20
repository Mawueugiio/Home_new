import 'package:auto_route/auto_route.dart';
import 'package:beta_project/core/globals.dart';
import 'package:beta_project/core/routes.gr.dart';
import 'package:beta_project/presentation/bloc/global_state.dart';
import 'package:beta_project/presentation/bloc/prefs/prefs_bloc.dart';
import 'package:beta_project/presentation/widget/loaders.dart';
import 'package:beta_project/presentation/widget/pin_entry.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  ThemeData _themeData;
  double _kHeight, _kWidth;
  bool _isLoading = false;
  PrefsBloc _prefsBloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _themeData = Theme.of(context);

    var size = MediaQuery.of(context).size;
    _kWidth = size.width;
    _kHeight = size.height;

    _prefsBloc = BlocProvider.of<PrefsBloc>(context);
  }

  @override
  void dispose() {
    _prefsBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(),
      extendBodyBehindAppBar: true,
      body: BlocBuilder<PrefsBloc, GlobalState>(
          bloc: _prefsBloc,
          builder: (context, state) {
            return AnimatedContainer(
              duration: kAnimationDuration,
              height: _kHeight,
              width: _kWidth,
              padding: EdgeInsets.symmetric(horizontal: kSpacingLarge),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/logo/logo.webp",
                    height: _kHeight * 0.3,
                    width: _kWidth * 0.7,
                  ),
                  Text(kAppName, style: _themeData.textTheme.headline4),
                  SizedBox(height: kSpacingLarge),
                  Text(
                    kAppDescShort,
                    style: _themeData.textTheme.subtitle2,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: kSpacingXXXLarge),
                  PinEntryTextField(
                    lastPin: "",
                    fields: 4,
                    isTextObscure: kReleaseMode,
                    onSubmit: (String value) {
                      print(value);
                      _prefsBloc.add(LoginEvent(value));
                      setState(() {
                        _isLoading = true;
                      });
                      Future.delayed(kDummyDuration).then((_) async {
                        setState(() {
                          _isLoading = state is SuccessState;
                        });
                        ExtendedNavigator.of(context)
                            .pushReplacementNamed(Routes.dashboardScreenRoute);
                      });
                    },
                  ),
                  SizedBox(height: kSpacingXXXLarge),
                  _isLoading ? Loading() : SizedBox.shrink(),
                ],
              ),
            );
          }),
    );
  }
}
