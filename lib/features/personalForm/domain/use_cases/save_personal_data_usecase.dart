import 'package:amanah/features/personalForm/data/models/personal_form_data_model.dart';

import '../repositories/personal_form_data_repository.dart';

class SavePersonalDataUseCase {
  final PersonalFormDataRepository personalFormDataRepository;

  SavePersonalDataUseCase({required this.personalFormDataRepository});

  Future<void> call(
      {required PersonalFormDataModel personalFormDataModel}) async {
    personalFormDataRepository.savePersonalFormData(
        personalFormDataModel: personalFormDataModel);
  }
}
