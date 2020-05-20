import 'package:beta_project/core/globals.dart';
import 'package:beta_project/data/models/device.dart';
import 'package:flutter/material.dart';

class DeviceTile extends StatefulWidget {
  final Device device;
  final Function onPress;

  const DeviceTile({Key key, this.device, this.onPress}) : super(key: key);

  @override
  _DeviceTileState createState() => _DeviceTileState();
}

class _DeviceTileState extends State<DeviceTile> {
  bool isViewing = false;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final size = MediaQuery.of(context).size;
    final kWidth = size.width;

    return InkWell(
      onTap: () {
        setState(() {
          isViewing = !isViewing && !widget.device.isEnabled;
        });
      },
      child: Container(
        width: kWidth * 0.42,
        margin: const EdgeInsets.all(kSpacingNormal),
        padding: const EdgeInsets.only(
          left: kSpacingXLarge,
          top: kSpacingLarge,
          bottom: kSpacingLarge,
        ),
        height: kXLargeAvatarSize,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kSpacingXLarge),
          color: widget.device.isEnabled
              ? themeData.accentColor.withOpacity(kDefaultOpacity)
              : themeData.scaffoldBackgroundColor,
        ),
        child: Stack(
          children: [
            Positioned(
              right: kSpacingXLarge,
              top: kSpacingLarge,
              child: Container(
                height: kSpacingLarge,
                width: kSpacingLarge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(kSpacingXLarge),
                  color: isViewing
                      ? themeData.primaryColor
                      : widget.device.isEnabled
                          ? Colors.transparent
                          : themeData.accentColor.withOpacity(kMidOpacity),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  widget.device.icon,
                  size: kAvatarSize,
                  color:
                      widget.device.isEnabled ? kWhite : themeData.primaryColor,
                ),
                SizedBox(height: kSpacingXLarge),
                Text(
                  widget.device.name,
                  style: themeData.textTheme.headline6.copyWith(
                      color: widget.device.isEnabled
                          ? kWhite
                          : themeData.primaryColor),
                ),
                SizedBox(height: kSpacingNormal),
                Text(
                  widget.device.metadata,
                  style: themeData.textTheme.caption.copyWith(
                      color: widget.device.isEnabled
                          ? kWhite
                          : themeData.primaryColor),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
