import 'package:flutter/material.dart';
import 'package:smart_usb_desktop/process-monitoring/presentation/utils/ProcessMonitoringUtils.dart';
import 'package:smart_usb_desktop/shared/presentation/widget/Hyperlink.dart';

class ScreenshotsCell extends StatelessWidget with ProcessMonitoringUtils {
  const ScreenshotsCell(
      {super.key, required this.imageList, required this.setIsGalleryOpen});

  final List<String> imageList;
  final void Function(bool) setIsGalleryOpen;

  @override
  Widget build(BuildContext context) {
    return imageList.isEmpty
        ? Text(
            "No screenshots yet",
            style: Theme.of(context).textTheme.titleSmall,
          )
        : Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                  height: 150,
                  child: Image.asset(imageList.first),
                ),
                Hyperlink(
                  onTap: () {
                    setIsGalleryOpen(true);
                  },
                  text: "see more >",
                  fontSize: 14,
                  color: Theme.of(context).primaryColor,
                  decorationColor: Theme.of(context).primaryColor,
                )
              ],
            ),
          );
  }
}
