import 'package:geolocator/geolocator.dart'as p;

import '../../data/models/personal_form_data_model.dart';



abstract class PersonalFormDataRepository {



  Future<void> savePersonalFormData({required
  PersonalFormDataModel personalFormDataModel});

  Future<p.Position> getCurrentLocation();
}
