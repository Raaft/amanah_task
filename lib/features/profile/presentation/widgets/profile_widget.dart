import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/profile_cubit.dart';

Widget buildProfileData(ProfileDataLoaded state, context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      _buildProfileField('name', state.personalFormData.name, context),
      _buildProfileField('email', state.personalFormData.email, context),
      _buildProfileField('gender', state.personalFormData.gender, context),
      _buildProfileField(
          'birthdate',
          DateFormat('dd MMMM y').format(state.personalFormData.birthdate),
          context),
      _buildProfileField('password', '********', context),
      // Masking the password
      const SizedBox(height: 20),
      BlocBuilder<ProfileCubit, ProfileState>(
  builder: (context, _) {
    return ElevatedButton(
        onPressed: () {
          context.read<ProfileCubit>().openOnMap(latitude: state.personalFormData.latitude, longitude: state.personalFormData.longitude);
        },
        child: const Text('open_position').tr(),
      );
  },
)
    ],
  );
}

Widget _buildProfileField(String label, String value, context) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width * .7,
          child: Text(
            '${label.tr()} : ',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.black45, // Customize color as needed
            ),
          ),
        ),

        Expanded(
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.brown,
            ),
          ),
        ),
      ],
    ),
  );
}


