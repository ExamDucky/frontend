import 'package:flutter/material.dart';
import 'package:smart_usb_desktop/device-communication/DeviceConnectingPage.dart';
import 'package:smart_usb_desktop/shared/presentation/widget/DashboardNavigation.dart';
import 'package:smart_usb_desktop/shared/presentation/widget/MainLayout.dart';
import 'package:window_manager/window_manager.dart';
import 'package:smart_usb_desktop/theme.dart';

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

  runApp(const MyApp());
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
