// ignore_for_file: must_be_immutable


import '../../domain/entities/form_data_entitiey.dart';

class PersonalFormDataModel extends PersonalFormData {
  PersonalFormDataModel({
    required String name,
    required String email,
    required String password,
    required String gender,
    required DateTime birthdate,
    required double latitude,
    required double longitude,
  }) : super(
            name: name,
            email: email,
            password: password,
            gender: gender,
            birthdate: birthdate,
            latitude: latitude,
            longitude: longitude);

  // Convert FormData instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'gender': gender,
      'birthdate': birthdate.toIso8601String(),
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  // Create FormData instance from JSON
  factory PersonalFormDataModel.fromJson(Map<String, dynamic> json) {
    return PersonalFormDataModel(
      name: json['name'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      gender: json['gender'] as String,
      birthdate: DateTime.parse(json['birthdate'] as String),
      latitude: json['latitude'] as double,
      longitude: json['longitude'] as double,
    );
  }
}
