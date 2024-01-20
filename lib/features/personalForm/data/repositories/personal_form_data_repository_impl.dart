import 'package:geolocator/geolocator.dart';

import '../../domain/repositories/personal_form_data_repository.dart';
import '../data_sources/local/personal_data_form_local_data_source.dart';
import '../models/personal_form_data_model.dart';

class PersonalFormDataRepositoryImpl implements PersonalFormDataRepository {
  final PersonalFormLocalDataSource personalFormLocalDataSource;

  PersonalFormDataRepositoryImpl({required this.personalFormLocalDataSource});

  @override
  Future<Position> getCurrentLocation() {
   return personalFormLocalDataSource.getCurrentLocation();


  }

  @override
  Future<void> savePersonalFormData(
      {required PersonalFormDataModel personalFormDataModel}) async {
    personalFormLocalDataSource.savePersonalFormData(
        personalFormDataModel: personalFormDataModel);


  }
}
