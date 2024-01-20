// personal_form_data_screen.dart

import 'package:amanah/features/personalForm/presentation/widgets/personal_form_data_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../manager/personal_form_data_cubit.dart';


class PersonalFormDataScreen extends StatelessWidget {
   PersonalFormDataScreen({super.key});
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  const Text('personal_form_data').tr(),
        actions: [
          InkWell(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                EasyLocalization.of(context)!.locale == const Locale('en', 'US')
                    ? "AR"
                    : "EN",
                style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
              ),
            ),
            onTap: () {
              context.read<PersonalFormDataCubit>().changLang(context);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
               PersonalFormDataWidget(formKey: formKey),
              Padding(
                padding: const EdgeInsets.all(22.0),
                child: ElevatedButton(
                  onPressed: () => formKey.currentState!.validate()?context.read<PersonalFormDataCubit>().submitForm(context):null,
                  child:  const Text('submit').tr(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
