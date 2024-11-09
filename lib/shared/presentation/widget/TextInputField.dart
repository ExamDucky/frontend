import 'package:flutter/material.dart';

class TextInputField extends StatelessWidget {
  const TextInputField(
      {super.key,
      required this.labelText,
      this.obscureText = false,
      this.controller,
      this.validator,
      this.onChanged,
      this.enabled = true,
      this.onPressed,
      this.height = 50,
      this.width = 300});

  final String labelText;
  final bool obscureText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool enabled;
  final void Function(String)? onChanged;
  final void Function()? onPressed;
  final double? width;
  final double? height;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextFormField(
        cursorColor: Theme.of(context).primaryColor,
        validator: validator,
        controller: controller,
        obscureText: obscureText,
        onChanged: onChanged,
        obscuringCharacter: "*",
        onFieldSubmitted: (value) {
          onPressed;
        },
        decoration: InputDecoration(
            enabled: enabled,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7),
              borderSide:
                  BorderSide(width: 2, color: Theme.of(context).primaryColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7),
              borderSide:
                  BorderSide(width: 2, color: Theme.of(context).primaryColor),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7),
              borderSide:
                  BorderSide(width: 2, color: Theme.of(context).primaryColor),
            ),
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 10),
            filled: true,
            fillColor: Theme.of(context).canvasColor,
            hoverColor: Colors.transparent,
            labelText: labelText,
            labelStyle: Theme.of(context)
                .textTheme
                .titleSmall
                ?.copyWith(letterSpacing: 0.1)),
        style:
            Theme.of(context).textTheme.bodySmall?.copyWith(letterSpacing: 0.1),
      ),
    );
  }
}
