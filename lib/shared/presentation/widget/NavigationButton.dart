import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationButton extends StatefulWidget {
  const NavigationButton(
      {super.key,
      required this.onPressed,
      required this.imagePath,
      required this.isClicked,
      required this.indexOfButton});

  final void Function()? onPressed;
  final String? imagePath;
  final bool isClicked;
  final int indexOfButton;

  @override
  State<NavigationButton> createState() => _NavigationButtonState();
}

class _NavigationButtonState extends State<NavigationButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 80,
      decoration: BoxDecoration(
          color: widget.isClicked
              ? Theme.of(context).primaryColor
              : Theme.of(context).canvasColor,
          border: Border.all(width: 2, color: Theme.of(context).primaryColor),
          borderRadius: widget.indexOfButton == 1
              ? const BorderRadius.only(topLeft: Radius.circular(7))
              : widget.indexOfButton == 4
                  ? const BorderRadius.only(topRight: Radius.circular(7))
                  : null),
      child: IconButton(
          onPressed: widget.onPressed,
          icon: Column(
            children: [
              SizedBox(
                width: 40,
                height: 40,
                child: widget.imagePath != null?
                Image.asset(
                  widget.imagePath!,
                  color: widget.isClicked ? null : Theme.of(context).primaryColor,
                ): Text(" "),
              ),
            ],
          )),
    );
  }
}
