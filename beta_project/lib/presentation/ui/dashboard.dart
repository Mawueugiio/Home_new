import 'package:auto_route/auto_route.dart';
import 'package:beta_project/core/globals.dart';
import 'package:beta_project/core/injection/service_locator.dart';
import 'package:beta_project/core/routes.gr.dart';
import 'package:beta_project/data/models/user.dart';
import 'package:beta_project/domain/entities/user.dart';
import 'package:beta_project/presentation/bloc/global_state.dart';
import 'package:beta_project/presentation/bloc/prefs/prefs_bloc.dart';
import 'package:beta_project/presentation/widget/buttons.dart';
import 'package:beta_project/presentation/widget/loaders.dart';
import 'package:beta_project/presentation/widget/power_usage.dart';
import 'package:beta_project/presentation/widget/room_item.dart';
import 'package:beta_project/presentation/widget/scenario_item.dart';
import 'package:beta_project/presentation/widget/snackbars.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  ThemeData _themeData;
  double _kHeight, _kWidth;
  PrefsBloc _prefsBloc;
  int _currentSceneIndex = 0;
  bool _areDevicesOff = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _themeData = Theme.of(context);

    var size = MediaQuery.of(context).size;
    _kWidth = size.width;
    _kHeight = size.height;

    _prefsBloc = BlocProvider.of<PrefsBloc>(context);
    _prefsBloc.add(GetCurrentUserEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: _themeData.primaryColor,
      appBar: AppBar(
        centerTitle: true,
        brightness: Brightness.dark,
        title: Text(kAppName, style: TextStyle(color: kWhite)),
        leading: IconButton(
            icon: Icon(Feather.power, color: kWhite),
            onPressed: () {
              showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  title: Text("Confirm logout"),
                  content: Text(
                      "Signing out will restrict you from receiving security notifications. Do you wish to continue?"),
                  actions: [
                    ButtonClear(
                      text: "No",
                      onPressed: () {
                        Navigator.of(ctx).pop();
                      },
                      themeData: _themeData,
                    ),
                    ButtonClear(
                      text: "Yes",
                      onPressed: () {
                        Navigator.of(ctx).pop();
                        sl
                            .get<FirebaseMessaging>()
                            .unsubscribeFromTopic(kSecurityTopic);
                        _prefsBloc.add(LogoutEvent());
                        ExtendedNavigator.of(context)
                            .pushReplacementNamed(Routes.loginScreenRoute);
                      },
                      themeData: _themeData,
                    ),
                  ],
                ),
              );
            }),
        actions: [
          IconButton(
            icon: Icon(Feather.user_plus, color: kWhite),
            onPressed: addNewMember,
          ),
          IconButton(
            icon: Icon(Feather.bell, color: kWhite),
            onPressed: () => ExtendedNavigator.of(context)
                .pushNamed(Routes.notificationsScreenRoute),
          ),
          IconButton(
            icon: Icon(Entypo.warning, color: kWhite),
            onPressed: () => ExtendedNavigator.of(context)
                .pushNamed(Routes.helpDeskScreenRoute),
          ),
        ],
      ),
      body: BlocBuilder(
        bloc: _prefsBloc,
        builder: (_, GlobalState state) {
          return AnimatedContainer(
            duration: kAnimationDuration,
            height: _kHeight,
            width: _kWidth,
            child: state is SuccessState<Stream<UserEntity>>
                ? StreamBuilder<User>(
                    stream: state.data,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        final user = snapshot.data;
                        print(user?.toJson());
                        return Stack(
                          fit: StackFit.loose,
                          children: [
                            // FIXME: Create widget for this
                            Container(
                              height: _kHeight * 0.25,
                              width: _kWidth,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Feather.cloud_lightning,
                                        size: kSpacingXXLarge,
                                        color: kWhite,
                                      ),
                                      SizedBox(height: kSpacingNormal),
                                      Text(
                                        "Lightning",
                                        style: _themeData.textTheme.subtitle2
                                            .copyWith(color: kWhite),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "19°",
                                        style: _themeData.textTheme.headline5
                                            .copyWith(
                                                color: kWhite,
                                                fontSize: kSpacingXXLarge - 3),
                                      ),
                                      SizedBox(height: kSpacingNormal),
                                      Text("Temp Outside",
                                          style: _themeData.textTheme.subtitle2
                                              .copyWith(color: kWhite)),
                                    ],
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "25°",
                                        style: _themeData.textTheme.headline5
                                            .copyWith(
                                                color: kWhite,
                                                fontSize: kSpacingXXLarge - 3),
                                      ),
                                      SizedBox(height: kSpacingNormal),
                                      Text("Temp Inside",
                                          style: _themeData.textTheme.subtitle2
                                              .copyWith(color: kWhite)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              top: _kHeight * 0.2,
                              bottom: 0,
                              width: _kWidth,
                              child: Container(
                                decoration: kCurvedBackground.copyWith(
                                    color: _themeData.scaffoldBackgroundColor),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    PowerUsage(height: _kHeight),
                                    SizedBox(height: _kHeight * 0.02),
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        decoration: kCurvedBackground.copyWith(
                                          color: _themeData.disabledColor,
                                        ),
                                        padding: EdgeInsets.symmetric(
                                          horizontal: kSpacingXLarge,
                                          vertical: kSpacingLarge,
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Scenarios",
                                                  style: _themeData
                                                      .textTheme.caption
                                                      .copyWith(
                                                    fontSize: 18,
                                                  ),
                                                ),
                                                IconButton(
                                                  icon: Icon(Feather.plus),
                                                  onPressed: () {
                                                    _scaffoldKey.currentState
                                                      ..removeCurrentSnackBar()
                                                      ..showSnackBar(
                                                        ErrorSnackBar(
                                                            "Cannot add new scenarios for now"),
                                                      );
                                                  },
                                                )
                                              ],
                                            ),
                                            SizedBox(height: kSpacingLarge),
                                            Container(
                                              height: _kWidth * 0.2,
                                              child: ListView.separated(
                                                separatorBuilder: (_, __) =>
                                                    SizedBox(
                                                        width: kSpacingLarge),
                                                itemCount: kScenes.length,
                                                physics:
                                                    BouncingScrollPhysics(),
                                                scrollDirection:
                                                    Axis.horizontal,
                                                shrinkWrap: false,
                                                itemBuilder: (_, int index) {
                                                  var scene = kScenes[index];
                                                  return ScenarioItem(
                                                    isEnabled:
                                                        _currentSceneIndex ==
                                                            index,
                                                    icon: scene.icon,
                                                    title: scene.title,
                                                    onPress: () {
                                                      setState(() {
                                                        _currentSceneIndex =
                                                            index;
                                                      });
                                                    },
                                                  );
                                                },
                                              ),
                                            ),
                                            SizedBox(height: kSpacingXXLarge),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Rooms",
                                                  style: _themeData
                                                      .textTheme.caption
                                                      .copyWith(
                                                    fontSize: 18,
                                                  ),
                                                ),
                                                SizedBox.shrink()
                                              ],
                                            ),
                                            SizedBox(height: kSpacingXLarge),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Container(
                                                  height: _kHeight * 0.23,
                                                  width: double.infinity,
                                                  child: ListView.separated(
                                                    separatorBuilder: (_, __) =>
                                                        SizedBox(
                                                            width:
                                                                kSpacingLarge),
                                                    itemCount: kRooms.length,
                                                    physics:
                                                        BouncingScrollPhysics(),
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    shrinkWrap: false,
                                                    itemBuilder:
                                                        (_, int index) {
                                                      final roomItem =
                                                          kRooms[index];

                                                      return RoomItem(
                                                        roomItem: roomItem,
                                                        onPress: () =>
                                                            ExtendedNavigator
                                                                    .of(context)
                                                                .pushNamed(
                                                          Routes
                                                              .roomDetailsScreenRoute,
                                                          arguments:
                                                              RoomDetailsScreenArguments(
                                                                  room:
                                                                      roomItem),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ),
                                                SizedBox(
                                                    height: kSpacingXLarge),
                                                ButtonPrimary(
                                                  text: _areDevicesOff
                                                      ? "Turn on devices"
                                                      : "Turn off all devices",
                                                  onPressed: () {
                                                    setState(() {
                                                      _areDevicesOff =
                                                          !_areDevicesOff;
                                                    });
                                                  },
                                                  width: _kWidth * 0.7,
                                                  themeData: _themeData,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      } else {
                        return SizedBox.shrink();
                      }
                    })
                : state is ErrorState
                    ? Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Feather.user_x, size: kLargeAvatarSize),
                            SizedBox(height: _kHeight * 0.15),
                            Text(state.reason,
                                style: _themeData.textTheme.bodyText2),
                          ],
                        ),
                      )
                    : Loading(),
          );
        },
      ),
    );
  }

  void addNewMember() async {
    await showSlidingBottomSheet(context, builder: (context) {
      return SlidingSheetDialog(
        elevation: 8,
        cornerRadius: 16,
        snapSpec: const SnapSpec(
          snap: true,
          snappings: [0.4, 0.7, 1.0],
          positioning: SnapPositioning.relativeToAvailableSpace,
        ),
        builder: (context, state) {
          return Container(
            height: 400,
            child: Center(
              child: Material(
                child: InkWell(
                  onTap: () => Navigator.pop(context, 'This is the result.'),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      'This is the content of the sheet',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      );
    }); // This is the result.
  }
}
