import 'package:week5/EXERCISE-1/model/ride_pref/ride_pref.dart';
import 'package:week5/EXERCISE-1/ride_pref_listener.dart';

class ConsoleLogger implements RidePreferencesListener{
  @override
  void onPreferenceSelected(RidePreference selectedPreference) {
    print("On preference changed: $selectedPreference");
  }
  
}