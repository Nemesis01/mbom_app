import 'package:flutter/material.dart';

class CustomDataCard extends StatelessWidget {
  //region Members
  final Widget child;
  final Widget background;
  final Color backgroundColor;
  //endregion

  //region Constructor
  CustomDataCard({
    this.child,
    this.background,
    this.backgroundColor = Colors.white,
  });
  //endregion

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Container(
        decoration: BoxDecoration(
            color: backgroundColor, borderRadius: BorderRadius.circular(12.0)),
        child: Stack(
          children: [
            background.runtimeType == Icon
                ? Positioned(
                    top: 0.0,
                    right: -25.0,
                    child: _background(context),
                  )
                : background,
            child,
          ],
        ),
      ),
    );
  }

  Widget _background(BuildContext context) {
    final iconColor = (backgroundColor == Theme.of(context).primaryColor)
        ? Theme.of(context).accentColor.withOpacity(0.24)
        : Theme.of(context).primaryColor.withOpacity(0.24);
    Widget back;
    if (this.background.runtimeType == Icon) {
      back = Icon(
        (this.background as Icon).icon,
        size: 120.0,
        color: iconColor,
      );
    }
    return back;
  }
}
