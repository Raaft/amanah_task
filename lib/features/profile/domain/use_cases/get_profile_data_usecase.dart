import '../../../personalForm/domain/entities/form_data_entitiey.dart';
import '../repositories/profile_repo.dart';

class GetProfileDataUseCase {
  final ProfileRepository profileRepository;

  GetProfileDataUseCase({required this.profileRepository});

  Future<PersonalFormData> call() {
    return profileRepository.getProfileData();
  }
}
