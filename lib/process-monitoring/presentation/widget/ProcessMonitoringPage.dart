import 'package:flutter/material.dart';
import 'package:smart_usb_desktop/exam-management/presentation/utils/TimerUtils.dart';
import 'package:smart_usb_desktop/process-monitoring/presentation/widget/ProcessMonitoringTable.dart';

class ProcessMonitoringPage extends StatefulWidget {
  const ProcessMonitoringPage(
      {super.key,
      required this.isExamStarted,
      required this.examRemainingTime,
      required this.examStartedAt,
      required this.isGalleryOpened,
      required this.setIsGalleryOpen});

  final bool isExamStarted;
  final String examStartedAt;
  final int examRemainingTime;
  final bool isGalleryOpened;
  final void Function(bool) setIsGalleryOpen;

  @override
  State<ProcessMonitoringPage> createState() => _ProcessMonitoringPageState();
}

class _ProcessMonitoringPageState extends State<ProcessMonitoringPage>
    with TimerUtils {
  @override
  Widget build(BuildContext context) {
    return widget.isExamStarted
        ? Stack(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 200,
                          child: Text(
                            textAlign: TextAlign.center,
                            widget.examStartedAt,
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ),
                        Text(
                          "PROCESS MONITORING",
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                        SizedBox(
                          width: 200,
                          child: Text(
                              textAlign: TextAlign.center,
                              formatTime(widget.examRemainingTime)),
                        )
                      ],
                    ),
                  ),
                  ProcessMonitoringTable(
                    setIsGalleryOpen: widget.setIsGalleryOpen,
                  )
                ],
              ),
              if (widget.isGalleryOpened)
                GestureDetector(
                  onTap: () {},
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.arrow_circle_left,
                            color: Theme.of(context).primaryColor,
                            size: 50,
                          ),
                        ),
                        Image.network(
                          "https://static.vecteezy.com/system/resources/thumbnails/013/226/049/small_2x/chain-link-icon-isolated-on-circle-background-vector.jpg",
                          width: 700,
                          height: 500,
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.arrow_circle_right,
                            color: Theme.of(context).primaryColor,
                            size: 50,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          )
        : Center(
            child: Text(
              "EXAM ISN'T STARTED",
              style: Theme.of(context)
                  .textTheme
                  .labelLarge
                  ?.copyWith(fontSize: 50),
            ),
          );
  }
}
