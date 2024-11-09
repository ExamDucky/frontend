import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DeviceConnectingPage extends StatefulWidget {
  const DeviceConnectingPage({super.key});

  @override
  State<DeviceConnectingPage> createState() => _DeviceConnectingPageState();
}

class _DeviceConnectingPageState extends State<DeviceConnectingPage> {
  String connectionMessage = "CONNECT YOUR USB DEVICE";
  Timer? _timer;

  @override
  void initState() {
    _timer = Timer.periodic(const Duration(milliseconds: 500), (timer) {
      int numberOfDots =
          connectionMessage.replaceAll("CONNECT YOUR USB DEVICE", "").length;
      if (numberOfDots < 3) {
        setState(() {
          connectionMessage += ".";
        });
      } else {
        setState(() {
          connectionMessage = "CONNECT YOUR USB DEVICE";
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(50.0, 80.0, 50.0, 80.0),
      child: Container(
        padding: const EdgeInsets.fromLTRB(30, 15, 30, 15),
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Theme.of(context).canvasColor,
            border: Border.all(width: 3, color: Theme.of(context).primaryColor),
            borderRadius: const BorderRadius.all(Radius.circular(20))),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                connectionMessage,
                style: Theme.of(context)
                    .textTheme
                    .labelLarge
                    ?.copyWith(fontSize: 40),
              ),
              Stack(
                children: [
                  Image.asset(
                    "assets/images/usb.png",
                    width: 250,
                  ),
                  Positioned(
                      right: 45,
                      top: 28,
                      child: Image.asset(
                        "assets/images/rectangle.png",
                        width: 90,
                      ))
                ],
              ),
              Container()
            ],
          ),
        ),
      ),
    );
  }
}
