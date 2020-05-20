import 'dart:async';

import 'package:beta_project/core/globals.dart';
import 'package:beta_project/core/injection/service_locator.dart';
import 'package:beta_project/core/services/db.dart';
import 'package:beta_project/data/models/user.dart';
import 'package:beta_project/presentation/bloc/global_state.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'prefs_event.dart';

/// Bloc implementation for [SharedPreferences]
class PrefsBloc extends Bloc<PrefsEvent, GlobalState> {
  SharedPreferences _prefs;

  // Constructor
  PrefsBloc() {
    sl.getAsync<SharedPreferences>().then((value) => _prefs = value);
  }

  @override
  GlobalState get initialState => InitialState();

  @override
  Stream<GlobalState> mapEventToState(
    PrefsEvent event,
  ) async* {
    final dbService = sl.get<DatabaseService>();
    yield LoadingState(true);

    if (event is LoginEvent) {
      // Get the user's pin
      await _prefs.setString(kPrefsKey, event.pin);
      await dbService.getOrCreateUser(event.pin);
      yield LoadingState(false);
      yield SuccessState(null);
    } else if (event is LogoutEvent) {
      await _prefs.clear();
      yield LoadingState(false);
      yield SuccessState(null);
    } else if (event is GetPinEvent) {
      final pin = _prefs?.getString(kPrefsKey);
      print("Prefs pin -> $pin");
      yield LoadingState(false);
      if (pin == null || pin.isEmpty)
        yield ErrorState("No PIN found for user");
      else
        yield SuccessState<String>(pin);
    } else if (event is GetMemberEvent) {
      yield LoadingState(false);
      yield SuccessState<Stream<User>>(dbService.getMemberById(event.pin));
    } else if (event is GetCurrentUserEvent) {
      final pin = _prefs?.getString(kPrefsKey);
      print("Prefs pin -> $pin");
      yield LoadingState(false);
      if (pin == null || pin.isEmpty)
        yield ErrorState("No PIN found for user");
      else {
        Globals.kUserPin = pin;
        yield SuccessState<Stream<User>>(dbService.getMemberById(pin));
      }
    }
  }
}
