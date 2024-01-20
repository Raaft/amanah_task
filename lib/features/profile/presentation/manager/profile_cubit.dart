// ignore_for_file: deprecated_member_use, depend_on_referenced_packages

import 'package:amanah/features/profile/domain/use_cases/get_profile_data_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../personalForm/domain/entities/form_data_entitiey.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit({required this.getProfileDataUseCase}) : super(ProfileInitial());

  final GetProfileDataUseCase getProfileDataUseCase;

  void openOnMap({
    required double latitude,
    required double longitude,
  }) async {
    final url = 'https://maps.google.com/?q=$latitude,$longitude';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> getProfileData() async {
    emit(ProfileDataLoading());
    try {
      final data = await getProfileDataUseCase();
      emit(ProfileDataLoaded(personalFormData: data));
    } catch (e) {
      emit(ProfileDataLoadError());
    }


  }

  // Locale currentLocale = Locale('en', 'US');

  // getCurrentLocale(context) {
  //   currentLocale = EasyLocalization.of(context)!.locale;
  //   emit(GetCurrentLocale());
  // }

  void changLang(context)async {
    if (EasyLocalization.of(context)!.locale == const Locale('en', 'US')) {
      EasyLocalization.of(context)?.setLocale(const Locale('ar', 'SA'));
    } else {
      EasyLocalization.of(context)?.setLocale(const Locale('en', 'US'));
    }


    // getCurrentLocale(context);
  }
}
