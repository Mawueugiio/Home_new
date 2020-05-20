import 'package:auto_route/auto_route.dart';
import 'package:beta_project/core/globals.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'injection/service_locator.dart';

/// This restricts unauthenticated users from accessing the guarded routes
/// https://pub.dev/packages/auto_route#route-guards
class AuthGuard extends RouteGuard {
  @override
  Future<bool> canNavigate(ExtendedNavigatorState navigator, String routeName,
      Object arguments) async {
    // Get shared prefs instance from service locator
    final _prefs = await sl.getAsync<SharedPreferences>();

    // check login status
    return _prefs.getString(kPrefsKey) != null;
  }
}
