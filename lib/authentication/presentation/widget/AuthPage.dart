import 'package:flutter/cupertino.dart';
import 'package:smart_usb_desktop/authentication/presentation/widget/LoginSection.dart';
import 'package:smart_usb_desktop/authentication/presentation/widget/ProfileSection.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isProfessorValidated = false;

  @override
  Widget build(BuildContext context) {
    return !isProfessorValidated ? LoginSection() : ProfileSection();
  }
}
