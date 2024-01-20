import 'package:amanah/features/personalForm/data/models/personal_form_data_model.dart';

import '../../domain/repositories/profile_repo.dart';
import '../data_sources/local/profile_local_data_source.dart';

class ProfileRepositoryImpl implements ProfileRepository{
  final ProfileLocalDataSource profileLocalDataSource;

  ProfileRepositoryImpl({required this.profileLocalDataSource});
  @override
  Future<PersonalFormDataModel> getProfileData() {
     return profileLocalDataSource.getProfileData();
  }

  @override
  void changeLang() {
    // TODO: implement changeLang
  }
}