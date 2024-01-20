import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/profile_cubit.dart';
import '../widgets/profile_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('profile_screen'.tr()),
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
              context.read<ProfileCubit>().changLang(context);
            },
          ),
        ],
      ),
      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          if (state is ProfileDataLoaded) {
            return buildProfileData(state, context);
          } else {
            // Handle other states if needed
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
