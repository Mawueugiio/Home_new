import 'package:beta_project/core/globals.dart';
import 'package:beta_project/core/injection/service_locator.dart';
import 'package:beta_project/core/services/notification_service.dart';
import 'package:beta_project/presentation/widget/recents.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class NotificationsScreen extends StatefulWidget {
  @override
  _NotificationsScreenState createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
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

    sl
        .get<NotificationService>()
        .show(title: "Hello", message: lorem_long);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      key: _scaffoldKey,
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: Container(
        height: _kHeight,
        width: _kWidth,
        child: Stack(
          children: [
            Container(
              height: _kHeight * 0.35,
              color: _themeData.scaffoldBackgroundColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Notifications",
                    style: _themeData.textTheme.headline4,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: kSpacingSmall),
                  Text(
                    "Alerts on who is entering your premises",
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
                width: _kWidth,
                decoration:
                    kCurvedBackground.copyWith(color: _themeData.disabledColor),
                padding: EdgeInsets.all(kSpacingXLarge),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Recents",
                          style: _themeData.textTheme.caption.copyWith(
                            fontSize: 18,
                          ),
                        ),
                        SizedBox.shrink()
                      ],
                    ),
                    SizedBox(height: kSpacingXLarge),
                    Flexible(
                      child: AnimationLimiter(
                        child: ListView.separated(
                            separatorBuilder: (_, __) =>
                                SizedBox(height: kSpacingNormal),
                            padding: const EdgeInsets.all(kSpacingNone),
                            physics: BouncingScrollPhysics(),
                            itemCount: kContacts.length,
                            itemBuilder: (_, int index) {
                              return AnimationConfiguration.staggeredList(
                                position: index,
                                duration: kAnimationDuration,
                                child: ScaleAnimation(
                                  child: FadeInAnimation(
                                    child:
                                        RecentMember(person: kContacts[index]),
                                  ),
                                ),
                              );
                            }),
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
