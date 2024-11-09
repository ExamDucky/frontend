import 'package:flutter/material.dart';

class PrimaryButton extends StatefulWidget {
  const PrimaryButton({
    super.key,
    this.height = 50,
    this.width,
    required this.onPressed,
    this.text,
    this.child,
  });

  final double height;
  final double? width;
  final void Function()? onPressed;
  final String? text;
  final Widget? child;

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                border:
                    Border.all(width: 3, color: Theme.of(context).primaryColor),
                borderRadius: const BorderRadius.all(Radius.circular(5))),
          ),
          Positioned(
            left: isClicked ? null : 0,
            top: isClicked ? null : 0,
            right: isClicked ? 0 : null,
            bottom: isClicked ? 0 : null,
            child: Padding(
              padding: isClicked
                  ? const EdgeInsets.only(right: 2, bottom: 2)
                  : const EdgeInsets.only(left: 2, top: 2),
              child: SizedBox(
                width: widget.width != null ? widget.width! - 10 : null,
                height: widget.height - 10,
                child: InkWell(
                  onTap: () {
                    widget.onPressed?.call();
                    setState(() {
                      isClicked = true;
                    });
                    Future.delayed(const Duration( milliseconds: 150), () {
                      setState(() {
                        isClicked = false;
                      });
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).canvasColor,
                        border: Border.all(
                            width: 3, color: Theme.of(context).canvasColor),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5))),
                    child: widget.child ??
                        Text(
                          widget.text ?? "",
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.labelMedium?.copyWith(color: Theme.of(context).primaryColor),
                        ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
