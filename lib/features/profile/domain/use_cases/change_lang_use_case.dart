import '../repositories/profile_repo.dart';

class ChangeLangUseCase {
  final ProfileRepository profileRepository;

  ChangeLangUseCase({required this.profileRepository});

  void call() {
    return profileRepository.changeLang();
  }
}
