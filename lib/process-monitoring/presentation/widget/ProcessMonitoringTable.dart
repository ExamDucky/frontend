import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:smart_usb_desktop/process-monitoring/presentation/view-models/StudentExamProcessMonitoringModel.dart';
import 'package:smart_usb_desktop/process-monitoring/presentation/widget/BlacklistedProcessesCell.dart';
import 'package:smart_usb_desktop/process-monitoring/presentation/widget/ScreenshotsCell.dart';

class ProcessMonitoringTable extends StatefulWidget {
  const ProcessMonitoringTable({super.key, required this.setIsGalleryOpen});

  final void Function(bool) setIsGalleryOpen;

  @override
  State<ProcessMonitoringTable> createState() => _ProcessMonitoringTableState();
}

class _ProcessMonitoringTableState extends State<ProcessMonitoringTable> {
  List<StudentExamProcessMonitoringModel> studentsProcessMonitoring = [];

  @override
  void didChangeDependencies() {
    studentsProcessMonitoring = [
      StudentExamProcessMonitoringModel(
          blacklistedProcesses: BlacklistedProcessesCell(processesList: []),
          latestScreenshot: ScreenshotsCell(
            imageList: [],
            setIsGalleryOpen: widget.setIsGalleryOpen,
          ),
          studentId: Text(
            "2024/3804",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          macAddress: Text(
            "01:23:45:67:89:ab",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall,
          )),
      StudentExamProcessMonitoringModel(
          blacklistedProcesses: BlacklistedProcessesCell(
              processesList: ["discord", "firefox", "chrome"]),
          latestScreenshot: ScreenshotsCell(
              imageList: [], setIsGalleryOpen: widget.setIsGalleryOpen),
          studentId: Text(
            "2024/3804",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          macAddress: Text(
            "01:23:45:67:89:ab",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall,
          )),
      StudentExamProcessMonitoringModel(
          blacklistedProcesses:
              BlacklistedProcessesCell(processesList: ["discord"]),
          latestScreenshot: ScreenshotsCell(imageList: [
            "https://static.vecteezy.com/system/resources/thumbnails/013/226/049/small_2x/chain-link-icon-isolated-on-circle-background-vector.jpg"
          ], setIsGalleryOpen: widget.setIsGalleryOpen),
          studentId: Text(
            "2024/3804",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          macAddress: Text(
            "01:23:45:67:89:ab",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall,
          ))
    ];
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: DataTable2(
            dataRowHeight: 70,
            columns: const [
              DataColumn2(
                label: Center(child: Text("student")),
                size: ColumnSize.S,
              ),
              DataColumn2(
                  label: Center(child: Text("MAC address")),
                  size: ColumnSize.M),
              DataColumn2(
                  label: Center(child: Text("blacklisted processes")),
                  size: ColumnSize.L),
              DataColumn2(
                  label: Center(child: Text("latest screenshot")),
                  size: ColumnSize.L),
            ],
            showBottomBorder: false,
            dataRowColor:
                WidgetStateProperty.all<Color>(Theme.of(context).cardColor),
            rows: studentsProcessMonitoring
                .map((s) => DataRow(cells: [
                      DataCell(Center(
                        child: s.studentId,
                      )),
                      DataCell(Center(
                        child: s.macAddress,
                      )),
                      DataCell(Center(
                        child: s.blacklistedProcesses,
                      )),
                      DataCell(Center(
                        child: s.latestScreenshot,
                      ))
                    ]))
                .toList()));
  }
}
