import 'dart:math';

import 'package:beta_project/data/models/contact.dart';
import 'package:beta_project/data/models/device.dart';
import 'package:beta_project/data/models/room.dart';
import 'package:beta_project/data/models/scene.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timeago/timeago.dart' as timeago;

/// Placeholder
const String lorem_short =
    "Augue neque gravida in fermentum et sollicitudin. In mollis nunc sed id semper risus in.";
const String lorem_long =
    "Augue neque gravida in fermentum et sollicitudin. In mollis nunc sed id semper risus in. Ac turpis egestas integer eget aliquet nibh. Vel turpis nunc eget lorem dolor sed.";

/// Time Utils
String formatTimestampAgo(int timestamp) =>
    timeago.format(DateTime.fromMillisecondsSinceEpoch(timestamp)).toString();

/// Shapes
final ShapeBorder kDialogShape = RoundedRectangleBorder(
  borderRadius: BorderRadius.all(Radius.circular(kSpacingLarge)),
);
const kDialogTitleStyle = const TextStyle(
    color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600);
const kDialogSubtitleStyle = const TextStyle(
    color: Colors.black87, fontSize: 16, fontWeight: FontWeight.w500);

/// Decorations
final BoxDecoration kCurvedBackground = BoxDecoration(
  borderRadius: BorderRadius.only(
    topLeft: Radius.circular(kSpacingXXLarge),
    topRight: Radius.circular(kSpacingXXLarge),
  ),
);
final BoxDecoration kColoredDecoration = BoxDecoration(
  borderRadius: BorderRadius.only(
    topLeft: Radius.circular(kSpacingXXLarge),
    topRight: Radius.circular(kSpacingXXLarge),
  ),
  color: kPrimaryColorVariant.withOpacity(kNoOpacity),
);

/// Fonts
final kDefaultFontFamily = GoogleFonts.montserratAlternates().fontFamily;
final kSecondaryFontFamily = GoogleFonts.rubik().fontFamily;

/// Animation Duration
const Duration kAnimationDuration = const Duration(milliseconds: 500);
const Duration kSliderDuration = const Duration(milliseconds: 1500);
const Duration kDummyDuration = const Duration(milliseconds: 2500);

/// Colors
const Color kDarkPrimaryColor = Color(0xff212121);
const Color kDarkAccentColor = Color(0xffbbabf6);
const Color kPrimaryColor = Color(0xFF666159);
const Color kPrimaryColorVariant = Color(0xFF666159);
const Color kSecondaryColor = Color(0xFF666159);
const Color kLightColor = Color(0xffffffff);
const Color kDisabledColor = Color(0xFFF2F2F2);
const Color kDisabledColorDark = Color(0xFF1E1E1E);
const Color kBlack = Colors.black87;
const Color kWhite = Colors.white;
const Color kFadedColor = Color(0xFFA0A5BD);
final kShadowColor = Color(0xFFD3D3D3).withOpacity(.84);

/// Dimens
// Buttons
const double kButtonHeight = 48.0;
// Avatars
const double kAvatarSize = 48.0;
const double kSmallAvatarSize = 36.0;
const double kLargeAvatarSize = 96.0;
const double kXLargeAvatarSize = 120.0;
// Z-Index
const double kCardElevation = 2.0;
const double kChatHeadElevation = 4.0;
const double kBottomNavElevation = 8.0;
// Opacity
const double kLightOpacity = 0.2;
const double kMidOpacity = 0.4;
const double kDefaultOpacity = 0.6;
const double kNoOpacity = 0.9;
// Spacing
const double kSpacingNone = 0.0;
const double kSpacingSmall = 4.0;
const double kSpacingNormal = 8.0;
const double kSpacingMid = 12.0;
const double kSpacingLarge = 16.0;
const double kSpacingXLarge = 24.0;
const double kSpacingXXLarge = 36.0;
const double kSpacingXXXLarge = 64.0;
const double kSpacingHuge = 96.0;

/// Constants
const String kAppName = "Home IoT System";
const String kAppNameShort = "HomeSys";
// FIXME: You can add you won description here
const String kAppDescShort =
    "Control, organise & manage compatible light, speakers, doors etc with one or more taps only.";

/// Keys
const String kPrefsName = "prefs_homesys";
const String kPrefsKey = "prefs_user_key";
const String kPrefsSettings = "prefs_settings";
const String kPrefsUser = "prefs_user";

/// Refs
const String kSecurityTopic = "security_notifications_topic";
const String kUsersRef = "users";
const String kMembersRef = "members";

/// Testing
const List<Scene> kScenes = [
  const Scene("Home", Feather.home),
  const Scene("Away", FlutterIcons.door_open_faw5s),
  const Scene("Sleep", EvaIcons.moonOutline),
  const Scene("Get up", EvaIcons.sunOutline),
];
const List<Room> kRooms = [
  const Room("Living Room", "assets/lr/lr.webp", 4),
  const Room("Bedroom", "assets/br/br.webp", 3),
  const Room("Kitchen", "assets/kt/kt.webp", 2),
];
final List<Device> kDevices = [
  Device("Light", FlutterIcons.oil_lamp_mco, Random().nextBool(),
      metadata: "60%"),
  Device("AC", FlutterIcons.snowflake_faw5s, Random().nextBool(),
      metadata: "23%"),
  Device("WiFi", EvaIcons.wifiOutline, Random().nextBool(), metadata: "On"),
  Device("Smart TV", FlutterIcons.tv_faw5s, Random().nextBool(),
      metadata: "Off"),
];
const List<Contact> kContacts = [
  const Contact(
      "Sarah Doe",
      "",
      "123",
      "https://images.unsplash.com/photo-1574981370294-edbbf06bb159?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
      1234,
      "Wife"),
  const Contact(
      "Samuel Bradley",
      "",
      "123",
      "https://images.unsplash.com/photo-1504593811423-6dd665756598?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
      1234,
      "Father"),
  const Contact(
      "Esther Mensah",
      "",
      "123",
      "https://images.unsplash.com/flagged/photo-1571837360114-edf5dba7b1dd?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
      1234,
      "Cousin"),
  const Contact(
      "Emmanuel Ashley",
      "",
      "123",
      "https://images.unsplash.com/photo-1526667900883-4a817696e7e8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
      1234,
      "Brother"),
];

//const List<Scene> kScenes = [];
const String kDefaultAvatar =
    "https://images.unsplash.com/flagged/photo-1558829608-12b0a5d6dbc1?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=700&q=60";
const String kDefaultEmail = "demo@domain.com";
const String kDefaultUserName = "John Doe";

abstract class Globals {
  static String kUserPin;
  static String kUser;
}
