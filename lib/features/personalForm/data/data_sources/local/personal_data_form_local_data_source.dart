import 'dart:convert';

import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/personal_form_data_model.dart';

abstract class PersonalFormLocalDataSource {
  Future<void> savePersonalFormData( {required PersonalFormDataModel personalFormDataModel});

  Future<Position> getCurrentLocation();
}

class PersonalFormLocalDataSourceImpl implements PersonalFormLocalDataSource {
  final SharedPreferences sharedPreferences;

  PersonalFormLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<Position> getCurrentLocation () async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {

      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    Position position=await Geolocator.getCurrentPosition();
    return position;
  }

  @override
  Future<void> savePersonalFormData(
      {required PersonalFormDataModel personalFormDataModel}) {
    return sharedPreferences.setString("savePersonalFormData", json.encode(personalFormDataModel.toJson()));
  }
}
