import 'package:amanah/config/routs/app_routs.dart';
import 'package:amanah/features/personalForm/data/models/personal_form_data_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

import '../../domain/use_cases/get_current_location_usecase.dart';
import '../../domain/use_cases/save_personal_data_usecase.dart';

part 'personal_form_data_state.dart';

class PersonalFormDataCubit extends Cubit<PersonalFormDataState> {
  PersonalFormDataCubit(
      {required this.getCurrentLocationUseCase,
      required this.savePersonalDataUseCase})
      : super(PersonalFormDataInitial());

  final GetCurrentLocationUseCase getCurrentLocationUseCase;
  final SavePersonalDataUseCase savePersonalDataUseCase;

  PersonalFormDataModel personalFormData = PersonalFormDataModel(
    name: '',
    email: '',
    password: '',
    gender: 'male',
    birthdate: DateTime(1, 5, 1997),
    latitude: 30.033,
    longitude: 31.233
  );

  Future<void> getCurrentLocation() async {
    try {
      Position position = await getCurrentLocationUseCase();

      personalFormData.longitude=position.longitude;
      personalFormData.latitude=position.latitude;

      emit(const GetCurrentLocationSuccess());
    } catch (e) {}
  }

  void updateBirthdate(DateTime date) {
    personalFormData.birthdate = date;
    emit(const UpdateBirthdaySuccess());
  }

  void updateName(String name) {
    personalFormData.name = name;
    emit(const UpdateNameSuccess());
  }

  void updateEmail(String email) {
    personalFormData.email = email;
    emit(const UpdateEmailSuccess());
  }

  void updatePassword(String password) {
    personalFormData.password = password;
    emit(const UpdatePasswordSuccess());
  }

  void updateGender(String gender) {
    personalFormData.gender = gender;
    emit(const UpdateGenderSuccess());
  }

  void pickDate(context) async {
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1, 5, 1995),
      lastDate: DateTime.now(),
    );
    if (selectedDate != null) {
      updateBirthdate(selectedDate);
    }
  }

  void submitForm(context) async {
    try {
      emit(PersonalFormDataLoading());

      await savePersonalDataUseCase(personalFormDataModel: personalFormData);

      emit(PersonalFormDataSuccess());

      Navigator.pushNamed(
        context,
        Routs.profileScreen,
      );
    } catch (e) {
      emit(const PersonalFormDataError('An error occurred'));
    }
  }

  void changLang(context)async {
    if (EasyLocalization.of(context)!.locale == const Locale('en', 'US')) {
      EasyLocalization.of(context)?.setLocale(const Locale('ar', 'SA'));
    } else {
      EasyLocalization.of(context)?.setLocale(const Locale('en', 'US'));
    }


    // getCurrentLocale(context);
  }


}
