import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_usb_desktop/authentication/domain/ProfessorModel.dart';
import 'package:smart_usb_desktop/authentication/presentation/widget/LoginSection.dart';
import 'package:smart_usb_desktop/authentication/presentation/widget/ProfileSection.dart';
import 'package:smart_usb_desktop/main.dart';
import 'package:smart_usb_desktop/shared/providers/Providers.dart';
import 'package:smart_usb_desktop/shared/view-models/DashboardButtonModel.dart';

final isProfessorValidatedProvider = StateProvider<bool>((ref) => false);

final selectedPageTypeProvider = StateProvider<PageType>((ref) => PageType.Authentication);


class AuthPage extends ConsumerStatefulWidget {
  const AuthPage({super.key});

  @override
  ConsumerState<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends ConsumerState<AuthPage> {
  String fullName = "";
  String email = "";
  String errorMessage = "";

  @override
  Widget build(BuildContext context) {
    ref.listen(postLoginControllerProvider, (_, state) async {
      if (state.hasValue && state.value is ProfessorModel) {
        var professor = state.value as ProfessorModel;
        await storage.write(key: "token", value: professor.token);
        setState(() {
          ref.read(isProfessorValidatedProvider.notifier).state = true;
          fullName = "${professor.firstName} ${professor.lastName}";
          email = professor.email;
        });
      }
      else{
        setState(() {
          errorMessage = "Invalid credentials";
          Future.delayed(const Duration(seconds: 2), () {
            setState(() {
              errorMessage = "";
            });
          });
        });
      }
    });

    return !ref.watch(isProfessorValidatedProvider) ? LoginSection(
      errorMessage: errorMessage,
    ) : ProfileSection(
      email: email,
      fullName: fullName,
      setIsProfessorActive: (value) {
        setState(() {
          ref.read(isProfessorValidatedProvider.notifier).state = value;
        });
      },
    );
  }
}
