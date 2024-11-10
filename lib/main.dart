import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:smart_usb_desktop/device-communication/DeviceConnectingPage.dart';
import 'package:smart_usb_desktop/shared/misc/Config.dart';
import 'package:smart_usb_desktop/shared/presentation/widget/DashboardNavigation.dart';
import 'package:smart_usb_desktop/shared/presentation/widget/MainLayout.dart';
import 'package:window_manager/window_manager.dart';
import 'package:smart_usb_desktop/theme.dart';


String? getCurrentProfileURL() {
  return config[activeProfile.name]?['domain'];
}

const storage = FlutterSecureStorage();


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await windowManager.ensureInitialized();

    WindowOptions windowOptions = const WindowOptions(
      fullScreen: false,
      size: Size(1200, 700),
      center: true,
      backgroundColor: Colors.transparent,
      skipTaskbar: false,
      titleBarStyle: TitleBarStyle.hidden,
    );

    await windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.setResizable(false);
      await windowManager.show();
      await windowManager.focus();
    });
  } catch (e) {
    print("Error initializing window manager: $e");
  }

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool connectedToDevice = false;
  bool isGalleryOpened = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: theme,
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: MainLayout(
          isGalleryOpened: isGalleryOpened,
          setIsGalleryOpen: (value) {
            setState(() {
              isGalleryOpened = value;
            });
          },
          child: !connectedToDevice
              ? DashboardNavigation(
                  isGalleryOpened: isGalleryOpened,
                  setIsGalleryOpen: (value) {
                    setState(() {
                      isGalleryOpened = value;
                    });
                  },
                )
              : const DeviceConnectingPage(),
        )));
  }
}
