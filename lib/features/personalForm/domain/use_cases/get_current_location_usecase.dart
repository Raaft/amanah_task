
import 'package:geolocator/geolocator.dart';

import '../repositories/personal_form_data_repository.dart';

class GetCurrentLocationUseCase {
  final PersonalFormDataRepository personalFormDataRepository;

  GetCurrentLocationUseCase({required this.personalFormDataRepository});

    Future<Position>  call() async {
   return personalFormDataRepository.getCurrentLocation();
  }
}
