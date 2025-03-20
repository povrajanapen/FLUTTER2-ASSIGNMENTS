import 'package:week5/EXERCISE-1/console_logger.dart';
import 'package:week5/EXERCISE-1/model/ride/locations.dart';
import 'package:week5/EXERCISE-1/model/ride_pref/ride_pref.dart';
import 'package:week5/EXERCISE-1/ride_pref_service.dart';

void main(){
  RidePreference initPreference = RidePreference(
    departure: Location(name: "Phnom Penh", country: Country.cambodia),
    departureDate: DateTime.now(),
    arrival: Location(name: "Siem Reap", country: Country.cambodia),
    requestedSeats: 2
  );

  RidePrefService ridePreferencesService = RidePrefService(initPreference);
  ConsoleLogger logger = ConsoleLogger();

  ridePreferencesService.addListener(logger);

  RidePreference preference1 = RidePreference(
    departure: Location(name: "Battambang", country: Country.cambodia),
    departureDate: DateTime.now().add(Duration(days: 2)),
    arrival: Location(name: "Kampot", country: Country.cambodia),
    requestedSeats: 2
  );

  RidePreference preference2 = RidePreference(
    departure: Location(name: "Kampot", country: Country.cambodia),
    departureDate: DateTime.now().add(Duration(days: 3)),
    arrival: Location(name: "Siem Reap", country: Country.cambodia),
    requestedSeats: 3
  );

  ridePreferencesService.selectedPreference(preference1);
  ridePreferencesService.selectedPreference(preference2);
}