import 'package:week5/EXERCISE-1/model/ride_pref/ride_pref.dart';

abstract class RidePreferencesListener {
  void onPreferenceSelected(RidePreference selectedPreference);
}