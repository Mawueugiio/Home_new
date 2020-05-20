import 'package:beta_project/core/globals.dart';
import 'package:beta_project/data/models/room.dart';
import 'package:flutter/material.dart';

class RoomItem extends StatefulWidget {
  final Room roomItem;
  final Function onPress;

  const RoomItem({Key key, this.roomItem, this.onPress}) : super(key: key);

  @override
  _RoomItemState createState() => _RoomItemState();
}

class _RoomItemState extends State<RoomItem> {
  @override
  Widget build(BuildContext context) {
    final _themeData = Theme.of(context);
    final size = MediaQuery.of(context).size;
    final kWidth = size.width;

    return InkWell(
      onTap: widget.onPress,
      child: Container(
        height: 150,
        width: kWidth * 0.4,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(widget.roomItem.image), fit: BoxFit.contain),
          borderRadius: BorderRadius.circular(kSpacingXLarge),
          color: _themeData.scaffoldBackgroundColor,
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                clipBehavior: Clip.hardEdge,
                padding: const EdgeInsets.all(kSpacingLarge),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(kSpacingXLarge),
                    bottomLeft: Radius.circular(kSpacingXLarge),
                  ),
                  color: _themeData.accentColor.withOpacity(kDefaultOpacity),
                ),
                child: Column(
                  children: [
                    Text(
                      widget.roomItem.name,
                      style: _themeData.textTheme.headline6
                          .copyWith(color: kWhite),
                    ),
                    SizedBox(height: kSpacingNormal),
                    Text(
                      "${widget.roomItem.devices} devices",
                      style:
                          _themeData.textTheme.caption.copyWith(color: kWhite),
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
