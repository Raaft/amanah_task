import 'package:amanah/features/personalForm/data/repositories/personal_form_data_repository_impl.dart';
import 'package:amanah/features/profile/data/data_sources/local/profile_local_data_source.dart';
import 'package:amanah/features/profile/data/repositories/profile_repo_impl.dart';
import 'package:amanah/features/profile/domain/use_cases/get_profile_data_usecase.dart';
import 'package:amanah/features/profile/presentation/manager/profile_cubit.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/personalForm/data/data_sources/local/personal_data_form_local_data_source.dart';
import 'features/personalForm/domain/repositories/personal_form_data_repository.dart';
import 'features/personalForm/domain/use_cases/get_current_location_usecase.dart';
import 'features/personalForm/domain/use_cases/save_personal_data_usecase.dart';
import 'features/personalForm/presentation/manager/personal_form_data_cubit.dart';
import 'features/profile/domain/repositories/profile_repo.dart';

final sl = GetIt.instance;

Future<void> init() async {
  /// personal form
  sl.registerFactory(() => PersonalFormDataCubit(
        getCurrentLocationUseCase: sl(),
        savePersonalDataUseCase: sl(),
      ));

  sl.registerLazySingleton(
      () => GetCurrentLocationUseCase(personalFormDataRepository: sl()));
  sl.registerLazySingleton(
      () => SavePersonalDataUseCase(personalFormDataRepository: sl()));
  sl.registerLazySingleton<PersonalFormDataRepository>(
      () => PersonalFormDataRepositoryImpl(personalFormLocalDataSource: sl()));
  sl.registerLazySingleton<PersonalFormLocalDataSource>(
      () => PersonalFormLocalDataSourceImpl(sharedPreferences: sl()));

  /// profile

  sl.registerFactory(() => ProfileCubit(getProfileDataUseCase: sl()));

  sl.registerLazySingleton(
      () => GetProfileDataUseCase(profileRepository: sl()));
  sl.registerLazySingleton<ProfileRepository>(
      () => ProfileRepositoryImpl(profileLocalDataSource: sl()));
  sl.registerLazySingleton<ProfileLocalDataSource>(() => ProfileLocalDataSourceImpl(
        sharedPreferences: sl(),
      ));

  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  sl.registerFactory<SharedPreferences>(() => sharedPreferences);
  sl.registerLazySingleton<Geolocator>(() => Geolocator());

  // sharedPreferences = sl<SharedPreferences>();
}
