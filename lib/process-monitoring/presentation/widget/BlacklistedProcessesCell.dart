import 'package:flutter/material.dart';
import 'package:smart_usb_desktop/process-monitoring/presentation/utils/ProcessMonitoringUtils.dart';
import 'package:smart_usb_desktop/shared/presentation/widget/Hyperlink.dart';

class BlacklistedProcessesCell extends StatelessWidget
    with ProcessMonitoringUtils {
  const BlacklistedProcessesCell({super.key, required this.processesList});

  final List<String> processesList;

  @override
  Widget build(BuildContext context) {
    return processesList.isNotEmpty
        ? processesList.length == 1
            ? Center(
                child: Text(
                  processesList.first,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: Colors.red),
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${processesList.first} and ",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: Colors.red),
                  ),
                  Hyperlink(
                      onTap: () {
                        showMoreBlacklistProcess(
                            context, "John Doe", processesList);
                      },
                      text: "${processesList.length - 1} more")
                ],
              )
        : Container();
  }
}
