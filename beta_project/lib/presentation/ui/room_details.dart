import 'package:beta_project/core/globals.dart';
import 'package:beta_project/data/models/room.dart';
import 'package:beta_project/presentation/widget/device_tile.dart';
import 'package:beta_project/presentation/widget/snackbars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class RoomDetailsScreen extends StatefulWidget {
  final Room room;

  const RoomDetailsScreen({Key key, this.room}) : super(key: key);

  @override
  _RoomDetailsScreenState createState() => _RoomDetailsScreenState();
}

class _RoomDetailsScreenState extends State<RoomDetailsScreen> {
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
                    widget.room.name,
                    style: _themeData.textTheme.headline4,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: kSpacingSmall),
                  Text(
                    "You have ${widget.room.devices} smart devices in this room",
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
                padding: EdgeInsets.symmetric(
                  horizontal: kSpacingXLarge,
                  vertical: kSpacingLarge,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Devices",
                          style: _themeData.textTheme.caption.copyWith(
                            fontSize: 18,
                          ),
                        ),
                        IconButton(
                          icon: Icon(Feather.plus),
                          onPressed: () {
                            _scaffoldKey.currentState
                              ..removeCurrentSnackBar()
                              ..showSnackBar(
                                ErrorSnackBar("Cannot add new devices for now"),
                              );
                          },
                        )
                      ],
                    ),
                    SizedBox(height: kSpacingXLarge),
                    Flexible(
                      child: AnimationLimiter(
                        child: GridView.count(
                          padding: const EdgeInsets.all(kSpacingNone),
                          physics: BouncingScrollPhysics(),
                          crossAxisCount: 2,
                          children: List.generate(
                            widget.room.devices,
                            (int index) {
                              return AnimationConfiguration.staggeredGrid(
                                position: index,
                                duration: kAnimationDuration,
                                columnCount: 2,
                                child: ScaleAnimation(
                                  child: FadeInAnimation(
                                    child: DeviceTile(
                                      device: kDevices[index],
                                      onPress: () {},
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
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
