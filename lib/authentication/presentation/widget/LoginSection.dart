import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_usb_desktop/shared/presentation/widget/PrimaryButton.dart';
import 'package:smart_usb_desktop/shared/presentation/widget/TextInputField.dart';
import 'package:smart_usb_desktop/shared/providers/Providers.dart';

class LoginSection extends ConsumerStatefulWidget {
  const LoginSection(
      {super.key,
      required this.errorMessage});

  final String errorMessage;

  @override
  ConsumerState<LoginSection> createState() => _LoginSectionState();
}

class _LoginSectionState extends ConsumerState<LoginSection> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final loginState = ref.watch(postLoginControllerProvider);

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
              obscureText: true,
              width: 400,
              controller: passwordController,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 90.0),
              child: PrimaryButton(
                onPressed: loginState.isLoading
                    ? null
                    : () {
                        ref.read(postLoginControllerProvider.notifier).login(
                            email: usernameController.value.text,
                            password: passwordController.value.text);
                      },
                width: 300,
                text: "login",
              ),
            ),
            if (loginState.hasValue)
              Text(
                widget.errorMessage,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall
                    ?.copyWith(color: Colors.red),
              )
          ],
        ))
      ],
    );
  }
}
