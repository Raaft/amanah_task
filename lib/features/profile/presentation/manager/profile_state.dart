part of 'profile_cubit.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileDataLoading extends ProfileState {}

class ProfileDataLoaded extends ProfileState {
  final PersonalFormData personalFormData;

  ProfileDataLoaded({required this.personalFormData});
}

class ProfileDataLoadError extends ProfileState {}
class GetCurrentLocale extends ProfileState {}
class ChangeLocale extends ProfileState {}
