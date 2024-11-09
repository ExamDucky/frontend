import 'package:flutter/material.dart';

class TestInformationItem extends StatelessWidget {
  const TestInformationItem(
      {super.key, required this.imagePath, required this.title});

  final String imagePath;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 15),
            child: SizedBox(
                width: 22,
                height: 22,
                child: Image.asset(imagePath, color: Theme.of(context).primaryColor,)),
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.titleSmall,
          )
        ],
      ),
    );
  }
}
