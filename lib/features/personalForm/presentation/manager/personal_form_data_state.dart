part of 'personal_form_data_cubit.dart';

abstract class PersonalFormDataState extends Equatable {
  const PersonalFormDataState();

  @override
  List<Object?> get props => [];
}

class PersonalFormDataInitial extends PersonalFormDataState {}

class PersonalFormDataLoading extends PersonalFormDataState {}

class PersonalFormDataSuccess extends PersonalFormDataState {}

class PersonalFormDataError extends PersonalFormDataState {
  final String error;

  const PersonalFormDataError(this.error);

  @override
  List<Object?> get props => [error];
}

class GetCurrentLocationSuccess extends PersonalFormDataState {
  const GetCurrentLocationSuccess();
}
class UpdateNameSuccess extends PersonalFormDataState {
  const UpdateNameSuccess();
}

class UpdateEmailSuccess extends PersonalFormDataState {
  const UpdateEmailSuccess();
}

class UpdatePasswordSuccess extends PersonalFormDataState {
  const UpdatePasswordSuccess();
}

class UpdateGenderSuccess extends PersonalFormDataState {
  const UpdateGenderSuccess();
}
class UpdateBirthdaySuccess extends PersonalFormDataState {
  const UpdateBirthdaySuccess();
}
class GetCurrentLocale extends PersonalFormDataState {
}
class ChangeLocale extends PersonalFormDataState {
}
