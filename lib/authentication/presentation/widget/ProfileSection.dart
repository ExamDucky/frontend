import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_usb_desktop/shared/presentation/widget/PrimaryButton.dart';

class ProfileSection extends StatefulWidget {
  const ProfileSection({super.key});

  @override
  State<ProfileSection> createState() => _ProfileSectionState();
}

class _ProfileSectionState extends State<ProfileSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Text(
              "PROFILE",
              style: Theme.of(context)
                  .textTheme
                  .labelLarge
                  ?.copyWith(fontSize: 30),
            ),
            Icon(
              Icons.person,
              color: Theme.of(context).primaryColor,
              size: 80,
            ),
            Text(
              "John Doe",
              style: Theme.of(context).textTheme.labelLarge,
            ),
            Text(
              "john.doe@email.com",
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 40.0),
          child: PrimaryButton(
            onPressed: () {},
            text: "log out",
            width: 300,
          ),
        )
      ],
    );
  }
}
