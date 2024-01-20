import 'package:amanah/features/profile/presentation/manager/profile_cubit.dart';
import 'package:amanah/features/profile/presentation/pages/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/personalForm/presentation/manager/personal_form_data_cubit.dart';
import '../../features/personalForm/presentation/pages/personal_form_data_screen.dart';
import '../../injection_contanier.dart' as di;

class Routs {
  static const String initialRoute = "/";
  static const String profileScreen = "profileScreen";
// static const String favoriteQuotesRoute = "/favoriteQuotes";
}

class AppRouts {
  static Route? onGeneratedRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routs.initialRoute:
        return MaterialPageRoute(
            builder: ((context) => BlocProvider(
                  create: (context) =>
                      di.sl<PersonalFormDataCubit>()..getCurrentLocation(),
                  child: PersonalFormDataScreen(),
                )));
      case Routs.profileScreen:
        return MaterialPageRoute(
            builder: ((context) => BlocProvider(
                  create: (context) => di.sl<ProfileCubit>()..getProfileData(),
                  child: const ProfileScreen(),
                )));

      default:
        return null;
    }
  }
}
