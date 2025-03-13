import 'package:week5/EXERCISE-1/model/ride_pref/ride_pref.dart';
import 'package:week5/EXERCISE-1/ride_pref_listener.dart';

class RidePrefService {
  RidePreference _currentPreference;
  final List<RidePreferencesListener> _listeners = [];

  RidePrefService(this._currentPreference);


  void addListener(RidePreferencesListener listeners){
    _listeners.add(listeners);
  }

  void removeListener(RidePreferencesListener listeners){
    _listeners.remove(listeners);
  }

  void notifyListeners(){
    for(var listener in _listeners){
      listener.onPreferenceSelected(_currentPreference);
    }
  }

  void selectedPreference(RidePreference preference){
    _currentPreference = preference;
    notifyListeners();
  }

  RidePreference get currentPreference => _currentPreference; 

}