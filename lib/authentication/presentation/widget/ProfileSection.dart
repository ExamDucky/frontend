import 'package:flutter/material.dart';
import 'package:smart_usb_desktop/main.dart';
import 'package:smart_usb_desktop/shared/presentation/widget/PrimaryButton.dart';

class ProfileSection extends StatefulWidget {
  const ProfileSection({
    super.key,
    required this.setIsProfessorActive,
    required this.email,
    required this.fullName,
  });

  final void Function(bool) setIsProfessorActive;
  final String email;
  final String fullName;

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
              widget.fullName,
              style: Theme.of(context).textTheme.labelLarge,
            ),
            Text(
              widget.email,
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 40.0),
          child: PrimaryButton(
            onPressed: () async {
              await storage.delete(key: "token");
              widget.setIsProfessorActive(false);
            },
            text: "log out",
            width: 300,
          ),
        )
      ],
    );
  }
}
