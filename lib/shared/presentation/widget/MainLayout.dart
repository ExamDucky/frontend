import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';

class MainLayout extends StatefulWidget {
  const MainLayout(
      {super.key,
      required this.child,
      required this.isGalleryOpened,
      required this.setIsGalleryOpen});

  final Widget child;
  final bool isGalleryOpened;
  final void Function(bool) setIsGalleryOpen;

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  void _handleTapOutsideGallery() {
    widget.setIsGalleryOpen(false);
  }

  @override
  Widget build(BuildContext context) {
    return WindowBorder(
      width: 2,
      color: Theme.of(context).cardColor,
      child: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/grid-background.png"),
                repeat: ImageRepeat.repeat)),
        child: GestureDetector(
          onTap: _handleTapOutsideGallery,
          child: Column(
            children: [
              WindowTitleBarBox(
                child: Row(
                  children: [
                    Expanded(child: MoveWindow()),
                    Row(
                      children: [
                        MinimizeWindowButton(
                          animate: true,
                          colors: WindowButtonColors(
                              iconNormal: Theme.of(context).primaryColor,
                              mouseOver:
                                  Theme.of(context).cardColor.withOpacity(0.5),
                              mouseDown: Theme.of(context).primaryColor,
                              iconMouseOver: Theme.of(context).hoverColor,
                              iconMouseDown: Theme.of(context).primaryColor),
                        ),
                        CloseWindowButton(
                          animate: true,
                          colors: WindowButtonColors(
                              iconNormal: Theme.of(context).primaryColor,
                              mouseOver:
                                  Theme.of(context).cardColor.withOpacity(0.5),
                              mouseDown: Theme.of(context).primaryColor,
                              iconMouseOver: Theme.of(context).hoverColor,
                              iconMouseDown: Theme.of(context).primaryColor),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.fromLTRB(60.0, 40.0, 60.0, 40.0),
                child: widget.child,
              ))
            ],
          ),
        ),
      ),
    );
  }
}
