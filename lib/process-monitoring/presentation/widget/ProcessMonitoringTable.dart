import 'dart:async';

import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_usb_desktop/exam-management/presentation/utils/DirectoryHandlingUtils.dart';
import 'package:smart_usb_desktop/process-monitoring/presentation/view-models/StudentAttemptModel.dart';
import 'package:smart_usb_desktop/process-monitoring/presentation/view-models/StudentExamProcessMonitoringModel.dart';
import 'package:smart_usb_desktop/process-monitoring/presentation/widget/BlacklistedProcessesCell.dart';
import 'package:smart_usb_desktop/process-monitoring/presentation/widget/ScreenshotsCell.dart';


class ProcessMonitoringTable extends StatefulWidget {
  const ProcessMonitoringTable({super.key, required this.setIsGalleryOpen});

  final void Function(bool) setIsGalleryOpen;

  @override
  State<ProcessMonitoringTable> createState() => _ProcessMonitoringTableState();
}



class _ProcessMonitoringTableState extends State<ProcessMonitoringTable> with DirectoryHandlingUtils {
  List<StudentExamProcessMonitoringModel> studentsProcessMonitoring = [];
  Timer? timer;
  List<String> currentDirectories = [];

  @override
  void initState() {
    timer = Timer.periodic(const Duration(seconds: 5), (timer) async {
      var temp = await monitorNewDirectories(currentDirectories);
      setState(() {
        currentDirectories += temp;
      });
      List<StudentAttemptModel> model = [];
      for (var path in currentDirectories) {
        var m = await readFileProcessMonitoring("${path}\\info.txt", context);
        if (m != null) {
          model.add(m);
        }
      }
      setState(() {
        studentsProcessMonitoring = model.map((e) => StudentExamProcessMonitoringModel(
            blacklistedProcesses: BlacklistedProcessesCell(processesList: e.blacklistedProcesses),
            latestScreenshot: ScreenshotsCell(
              imageList: e.latestScreenshot!,
              setIsGalleryOpen: widget.setIsGalleryOpen,
            ),
            studentId: Text(
              e.studentId,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            macAddress: Text(
              e.macAddress,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall,
            ))).toList();
      });
    });
    super.initState();
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
