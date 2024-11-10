import 'package:flutter/material.dart';

class TextInputIconField extends StatelessWidget {
  const TextInputIconField(
      {super.key,
      required this.labelText,
      this.obscureText = false,
      this.controller,
      this.validator,
      required this.icon,
      this.onChanged,
      this.enabled = true,
      this.height = 50,
      this.onTap,
      this.width = 300, this.onIconTap});

  final String labelText;
  final bool obscureText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool enabled;
  final IconData icon;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final double? width;
  final double? height;
  final void Function()? onIconTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextFormField(
        onTap: onTap,
        cursorColor: Theme.of(context).primaryColor,
        validator: validator,
        controller: controller,
        obscureText: obscureText,
        onChanged: onChanged,
        obscuringCharacter: "*",
        decoration: InputDecoration(
            enabled: enabled,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide:
                  BorderSide(width: 3, color: Theme.of(context).cardColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide:
                  BorderSide(width: 3, color: Theme.of(context).cardColor),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide:
                  BorderSide(width: 3, color: Theme.of(context).cardColor),
            ),
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 10),
            filled: true,
            fillColor: Theme.of(context).cardColor,
            hoverColor: Colors.transparent,
            suffixIcon: IconButton(
                onPressed: onIconTap,
                icon: Icon(
                  icon,
                  color: Theme.of(context).primaryColor,
                  size: 35,
                )),
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
