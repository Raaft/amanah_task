import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'config/routs/app_routs.dart';
import 'config/thems/app_them.dart';
import 'core/utils/app_strings.dart';
import 'injection_contanier.dart' as di;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await di. init();
  runApp(EasyLocalization(
      supportedLocales: const [Locale('en', 'US'), Locale('ar', 'SA')],
      fallbackLocale: const Locale('en', 'US'),
      path: 'lib/res/translations',
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appName,
      theme: appTheme(),
      onGenerateRoute: AppRouts.onGeneratedRoute,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
    );
  }
}
