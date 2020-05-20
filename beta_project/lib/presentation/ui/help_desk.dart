import 'package:beta_project/core/globals.dart';
import 'package:beta_project/presentation/widget/buttons.dart';
import 'package:beta_project/presentation/widget/contact.dart';
import 'package:beta_project/presentation/widget/snackbars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class HelpDeskScreen extends StatefulWidget {
  @override
  _HelpDeskScreenState createState() => _HelpDeskScreenState();
}

class _HelpDeskScreenState extends State<HelpDeskScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  ThemeData _themeData;
  double _kHeight, _kWidth;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _themeData = Theme.of(context);

    var size = MediaQuery.of(context).size;
    _kWidth = size.width;
    _kHeight = size.height;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(),
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: Container(
        height: _kHeight,
        width: _kWidth,
        child: Stack(
          fit: StackFit.loose,
          children: [
            Container(
              height: _kHeight * 0.35,
              color: _themeData.scaffoldBackgroundColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Help desk",
                    style: _themeData.textTheme.headline4,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: kSpacingSmall),
                  Text(
                    "Find all your emergencey contacts",
                    style: _themeData.textTheme.subtitle2,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Positioned(
              top: _kHeight * 0.3,
              bottom: 0,
              width: _kWidth,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: kSpacingXLarge,
                  vertical: kSpacingLarge,
                ),
                width: _kWidth,
                decoration:
                    kCurvedBackground.copyWith(color: _themeData.disabledColor),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Emergency contacts",
                          style: _themeData.textTheme.caption.copyWith(
                            fontSize: 18,
                          ),
                        ),
                        IconButton(
                          icon: Icon(Feather.user_plus),
                          onPressed: () {
                            _scaffoldKey.currentState
                              ..removeCurrentSnackBar()
                              ..showSnackBar(
                                ErrorSnackBar(
                                    "Cannot add new contacts for now"),
                              );
                          },
                        )
                      ],
                    ),
                    Flexible(
                      child: AnimationLimiter(
                        child: ListView.separated(
                          physics: BouncingScrollPhysics(),
                          padding: const EdgeInsets.all(kSpacingNone),
                          itemCount: kContacts.length,
                          separatorBuilder: (_, __) =>
                              SizedBox(width: kSpacingLarge),
                          itemBuilder: (BuildContext context, int index) {
                            return AnimationConfiguration.staggeredList(
                              position: index,
                              duration: kAnimationDuration,
                              child: SlideAnimation(
                                verticalOffset: 50.0,
                                child: FadeInAnimation(
                                  child: EmergencyContact(
                                      person: kContacts[index]),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: kSpacingLarge),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Services",
                          style: _themeData.textTheme.caption.copyWith(
                            fontSize: 18,
                          ),
                        ),
                        SizedBox.shrink(),
                      ],
                    ),
                    Flexible(
                      child: ListView(
                        padding: const EdgeInsets.all(kSpacingNone),
                        physics: BouncingScrollPhysics(),
                        children: [
                          ListTile(
                            title: Text("Ambulance"),
                            subtitle: Text("Get access to an ambulance"),
                            leading: Container(
                              height: kAvatarSize,
                              width: kAvatarSize,
                              alignment: Alignment.center,
                              child: Icon(FlutterIcons.ambulance_faw),
                            ),
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (ctx) => AlertDialog(
                                  title: Text("Ambulance"),
                                  content: Text(lorem_short),
                                  actions: [
                                    ButtonClear(
                                        text: "Dismiss",
                                        onPressed: () =>
                                            Navigator.of(ctx).pop(),
                                        themeData: _themeData),
                                    ButtonClear(
                                        text: "Call now",
                                        onPressed: () =>
                                            Navigator.of(ctx).pop(),
                                        themeData: _themeData),
                                  ],
                                ),
                              );
                            },
                            contentPadding: const EdgeInsets.all(kSpacingSmall),
                          ),
                          ListTile(
                            title: Text("Police"),
                            subtitle: Text("Get access to a police officer"),
                            leading: Container(
                              height: kAvatarSize,
                              width: kAvatarSize,
                              alignment: Alignment.center,
                              child: Icon(Feather.users),
                            ),
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (ctx) => AlertDialog(
                                  title: Text("Police"),
                                  content: Text(lorem_short),
                                  actions: [
                                    ButtonClear(
                                        text: "Dismiss",
                                        onPressed: () =>
                                            Navigator.of(ctx).pop(),
                                        themeData: _themeData),
                                    ButtonClear(
                                        text: "Call now",
                                        onPressed: () =>
                                            Navigator.of(ctx).pop(),
                                        themeData: _themeData),
                                  ],
                                ),
                              );
                            },
                            contentPadding: const EdgeInsets.all(kSpacingSmall),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: kSpacingLarge),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Actions",
                          style: _themeData.textTheme.caption.copyWith(
                            fontSize: 18,
                          ),
                        ),
                        SizedBox.shrink(),
                      ],
                    ),
                    Flexible(
                      child: ListView(
                        padding: const EdgeInsets.all(kSpacingNone),
                        physics: BouncingScrollPhysics(),
                        children: [
                          ListTile(
                            title: Text("Change key"),
                            leading: Container(
                              height: kAvatarSize,
                              width: kAvatarSize,
                              alignment: Alignment.center,
                              child: Icon(AntDesign.lock),
                            ),
                            onTap: () {
                              _scaffoldKey.currentState
                                ..removeCurrentSnackBar()
                                ..showSnackBar(
                                  ErrorSnackBar("Action not supported"),
                                );
                            },
                            contentPadding: const EdgeInsets.all(kSpacingSmall),
                          ),
                          ListTile(
                            title: Text("Turn off all devices"),
                            leading: Container(
                              height: kAvatarSize,
                              width: kAvatarSize,
                              alignment: Alignment.center,
                              child: Icon(Feather.tv),
                            ),
                            onTap: () {
                              _scaffoldKey.currentState
                                ..removeCurrentSnackBar()
                                ..showSnackBar(
                                  ErrorSnackBar("Action not supported"),
                                );
                            },
                            contentPadding: const EdgeInsets.all(kSpacingSmall),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
