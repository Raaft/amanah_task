// personal_form_data_form.dart

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../manager/personal_form_data_cubit.dart';

class PersonalFormDataWidget extends StatelessWidget {
  const PersonalFormDataWidget({super.key, this.formKey});

  final GlobalKey<FormState>? formKey;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PersonalFormDataCubit, PersonalFormDataState>(
      builder: (context, state) {
        return Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                onChanged: (value) =>
                    context.read<PersonalFormDataCubit>().updateName(value),
                validator: (value) {
                  if (value == "") {
                    return 'enter_name'.tr();
                  }
                  return null; // Return null if the validation passes
                },
                decoration:  InputDecoration(labelText: 'name'.tr()),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                onChanged: (value) =>
                    context.read<PersonalFormDataCubit>().updateEmail(value),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'enter_email'.tr();
                  } else if (!value.contains('@')) {
                    return 'valid_email'.tr();
                  }
                  return null; // Return null if the validation passes
                },
                decoration:  InputDecoration(labelText: 'email'.tr()),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                onChanged: (value) =>
                    context.read<PersonalFormDataCubit>().updatePassword(value),
                decoration:  InputDecoration(labelText: 'password'.tr()),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'enter_password'.tr();
                  } else if (value.length < 6) {
                    return 'password_length'.tr();
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              DropdownButtonFormField(
                value: context
                    .read<PersonalFormDataCubit>()
                    .personalFormData
                    .gender,
                onChanged: (value) => context
                    .read<PersonalFormDataCubit>()
                    .updateGender(value.toString()),
                items: ['male', 'female']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                decoration:  InputDecoration(labelText: 'gender'.tr()),
              ),
              const SizedBox(height: 16.0),
              InkWell(
                onTap: ()=>   context
                    .read<PersonalFormDataCubit>()
                    .pickDate(context),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        '${'birthdate'.tr()}  :${DateFormat('dd MMMM yyyy').format(context.read<PersonalFormDataCubit>().personalFormData.birthdate)}'),
                    const Icon(Icons.calendar_today),

                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
