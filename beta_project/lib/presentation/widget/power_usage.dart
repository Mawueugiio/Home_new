import 'package:beta_project/core/globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class PowerUsage extends StatelessWidget {
  const PowerUsage({
    Key key,
    @required double height,
  })  : _kHeight = height,
        super(key: key);

  final double _kHeight;

  @override
  Widget build(BuildContext context) {
    final ThemeData _themeData = Theme.of(context);
    bool isDarkMode = _themeData.brightness == Brightness.dark;

    return Container(
      width: double.infinity,
      height: _kHeight * 0.12,
      margin: EdgeInsets.all(kSpacingXLarge),
      decoration: BoxDecoration(
        color: _themeData.disabledColor,
        borderRadius: BorderRadius.circular(kSpacingXLarge),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                FlutterIcons.plug_faw5s,
                color: isDarkMode ? kWhite : _themeData.primaryColor,
              ),
              SizedBox(width: kSpacingNormal),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "29,5",
                          style: _themeData.textTheme.headline5.copyWith(
                            color:
                                isDarkMode ? kWhite : _themeData.primaryColor,
                          ),
                        ),
                        TextSpan(
                          text: " KwH",
                          style: _themeData.textTheme.caption.copyWith(
                            color:
                                isDarkMode ? kWhite : _themeData.primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: kSpacingNormal),
                  Text(
                    "Power usage today",
                    style: _themeData.textTheme.overline.copyWith(
                      color: isDarkMode ? kWhite : _themeData.primaryColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                FontAwesome5Solid.plug,
                color: isDarkMode ? kWhite : _themeData.primaryColor,
              ),
              SizedBox(width: kSpacingNormal),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "303",
                          style: _themeData.textTheme.headline5.copyWith(
                            color:
                                isDarkMode ? kWhite : _themeData.primaryColor,
                          ),
                        ),
                        TextSpan(
                          text: " KwH",
                          style: _themeData.textTheme.caption.copyWith(
                            color:
                                isDarkMode ? kWhite : _themeData.primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: kSpacingNormal),
                  Text(
                    "Power usage this month",
                    style: _themeData.textTheme.overline.copyWith(
                      color: isDarkMode ? kWhite : _themeData.primaryColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
