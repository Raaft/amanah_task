import 'dart:convert';

import 'package:amanah/features/personalForm/data/models/personal_form_data_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ProfileLocalDataSource {
  Future<PersonalFormDataModel> getProfileData();

  void changeLang() {}
}

class ProfileLocalDataSourceImpl implements ProfileLocalDataSource {
  final SharedPreferences sharedPreferences;

  ProfileLocalDataSourceImpl({required this.sharedPreferences});

  @override
  void changeLang() {}

  @override
  Future<PersonalFormDataModel> getProfileData() {

    final jsonString = sharedPreferences.getString('savePersonalFormData');

    print ('jsonString $jsonString');

    final cacheData =
    Future.value(PersonalFormDataModel.fromJson(json.decode(jsonString!)));
    return cacheData;

  }
}
