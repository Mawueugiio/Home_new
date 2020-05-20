import 'package:auto_route/auto_route.dart';
import 'package:auto_route/auto_route_annotations.dart';
import 'package:beta_project/presentation/ui/dashboard.dart';
import 'package:beta_project/presentation/ui/help_desk.dart';
import 'package:beta_project/presentation/ui/login.dart';
import 'package:beta_project/presentation/ui/notifications.dart';
import 'package:beta_project/presentation/ui/room_details.dart';
import 'package:beta_project/presentation/ui/welcome.dart';

import 'guards.dart';

/// Route manager
/// Registers all routes in the application
/// https://pub.dev/packages/auto_route
@CustomAutoRouter(
    transitionsBuilder: TransitionsBuilders.slideTop,
    durationInMilliseconds: 400)
class $Router {
  @initial
  WelcomeScreen welcomeScreenRoute;
  LoginScreen loginScreenRoute;

  @GuardedBy([AuthGuard])
  DashboardScreen dashboardScreenRoute;
  @GuardedBy([AuthGuard])
  NotificationsScreen notificationsScreenRoute;
  @GuardedBy([AuthGuard])
  RoomDetailsScreen roomDetailsScreenRoute;
  @GuardedBy([AuthGuard])
  HelpDeskScreen helpDeskScreenRoute;
}
