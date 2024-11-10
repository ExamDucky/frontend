import 'package:flutter/material.dart';

class TestSearchItem extends StatelessWidget {
  const TestSearchItem({super.key, required this.title, required this.onTap});

  final String title;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          alignment: Alignment.centerLeft,
            height: 50,
            width: 300,
            child: Text(
              title,
              overflow: TextOverflow.ellipsis,
              style: Theme
                  .of(context)
                  .textTheme
                  .titleSmall,
            )
        ),
      ),
    );
  }
}
