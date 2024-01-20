// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';


class PersonalFormData extends Equatable {
  String name;
  String email;
  String password;
  String gender;
  DateTime birthdate;
  double longitude;
  double latitude;

  PersonalFormData({
    required this.name,
    required this.email,
    required this.password,
    required this.gender,
    required this.birthdate,
    required this.latitude,
    required this.longitude,
  });

  @override
  List<Object?> get props =>
      [name, email, password, gender, birthdate, latitude, longitude];
}
