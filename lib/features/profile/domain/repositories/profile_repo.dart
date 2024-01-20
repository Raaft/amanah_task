import '../../../personalForm/domain/entities/form_data_entitiey.dart';

abstract class    ProfileRepository {





  Future<PersonalFormData> getProfileData();
  void changeLang(){}

}
