import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_usb_desktop/shared/presentation/widget/PrimaryButton.dart';
import 'package:smart_usb_desktop/shared/presentation/widget/TextInputField.dart';

class LoginSection extends StatefulWidget {
  const LoginSection({super.key});

  @override
  State<LoginSection> createState() => _LoginSectionState();
}

class _LoginSectionState extends State<LoginSection> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 100.0),
          child: Text(
            "LOGIN",
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ),
        Form(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 50.0),
              child: TextInputField(
                labelText: "username",
                width: 400,
                controller: usernameController,
              ),
            ),
            TextInputField(
              labelText: "password",
              width: 400,
              controller: passwordController,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 90.0),
              child: PrimaryButton(
                onPressed: () {},
                width: 300,
                text: "login",
              ),
            )
          ],
        ))
      ],
    );
  }
}
