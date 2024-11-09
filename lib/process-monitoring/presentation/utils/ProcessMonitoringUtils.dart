import 'package:flutter/material.dart';

mixin ProcessMonitoringUtils {
  String _printProcessesNames(List<String> processesList) {
    String returnValue = "";
    for (int i = 0; i < processesList.length; i++) {
      if (i == processesList.length - 1) {
        returnValue += processesList[i];
      } else {
        returnValue += "${processesList[i]}, ";
      }
    }
    return returnValue;
  }

  void showMoreBlacklistProcess(
      BuildContext context, String fullName, List<String> blockListProcesses) {
    showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
            title: Container(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.close),
                color: Theme.of(context).primaryColor,
              ),
            ),
            content: SizedBox(
              width: 400,
              height: 250,
              child: Column(
                children: [
                  const Icon(
                    Icons.info,
                    color: Colors.red,
                    size: 60,
                  ),
                  const SizedBox(height: 20,),
                  Text(
                    "Blocklisted processes running\n"
                    "[$fullName]",
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall
                        ?.copyWith(color: Colors.red),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Text(
                    _printProcessesNames(blockListProcesses),
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall
                        ?.copyWith(color: Colors.red),
                  ),
                  const SizedBox(
                    height: 40,
                  )
                ],
              ),
            )));
  }
}
