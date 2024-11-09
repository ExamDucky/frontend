import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_usb_desktop/exam-management/presentation/view-models/StudentExamAttemptModel.dart';

class ExamManagementRightSection extends StatefulWidget {
  const ExamManagementRightSection({super.key});

  @override
  State<ExamManagementRightSection> createState() =>
      _ExamManagementRightSectionState();
}

class _ExamManagementRightSectionState
    extends State<ExamManagementRightSection> {
  List<StudentExamAttemptModel> studentList = [];

  @override
  void didChangeDependencies() {
    studentList = [
      StudentExamAttemptModel(
          examSubmitted: const Icon(
            Icons.check,
            color: Colors.green,
          ),
          studentId: Text(
            "2024/3804",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          grade: Text(
            "89",
            style: Theme.of(context).textTheme.bodySmall,
          ),
          plagiarismPercent: Text(
            "0%",
            style: Theme.of(context).textTheme.bodySmall,
          ),
          isValid: const Icon(
            Icons.circle,
            color: Colors.green,
          )),
      StudentExamAttemptModel(
          examSubmitted: const Icon(
            Icons.check,
            color: Colors.green,
          ),
          studentId: Text(
            "2020/0069",
            overflow: TextOverflow.fade,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          grade: Text(
            "89",
            style: Theme.of(context).textTheme.bodySmall,
          ),
          plagiarismPercent: Text(
            "0%",
            style: Theme.of(context).textTheme.bodySmall,
          ),
          isValid: const Icon(
            Icons.circle,
            color: Colors.green,
          )),
      StudentExamAttemptModel(
          examSubmitted: const Icon(
            Icons.close,
            color: Colors.red,
          ),
          studentId: Text(
            "2020/0002",
            style: Theme.of(context).textTheme.bodySmall,
          ),
          grade: Text(
            "89",
            style: Theme.of(context).textTheme.bodySmall,
          ),
          plagiarismPercent: Text(
            "40%",
            style: Theme.of(context).textTheme.bodySmall,
          ),
          isValid: const Icon(
            Icons.circle,
            color: Colors.red,
          ))
    ];
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DataTable2(
          columns: const [
            DataColumn2(label: Center(child: Text("student")), size: ColumnSize.M,),
            DataColumn2(label: Center(child: Text("exam submitted")), size: ColumnSize.L),
            DataColumn2(label: Center(child: Text("plagiarism")), size: ColumnSize.M),
            DataColumn2(label: Center(child: Text("valid")), size: ColumnSize.S),
            DataColumn2(label: Center(child: Text("grade")), size: ColumnSize.S)
          ],
          showBottomBorder: false,
          dataRowColor:
              WidgetStateProperty.all<Color>(Theme.of(context).cardColor),
          rows: studentList
              .map((s) => DataRow(
              cells: [
                    DataCell(Center(child: s.studentId,)),
                    DataCell(Center(child: s.examSubmitted,)),
                    DataCell(Center(child: s.plagiarismPercent,)),
                    DataCell(Center(child: s.isValid,)),
                    DataCell(Center(child: s.grade,))
                  ]))
              .toList()),
    );
  }
}
