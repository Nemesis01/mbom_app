import 'package:flutter/material.dart';

class CustomTextTile extends StatelessWidget {
  //region Members
  final IconData icon;
  //final String text;
  final String label;
  final Color backgroundColor;
  final Color foregroundColor;
  final VoidCallback onPressed;
  //endregion

  //region Constructor
  CustomTextTile({
    this.icon,
    //this.text,
    this.backgroundColor = Colors.white,
    this.foregroundColor = Colors.deepPurple,
    @required this.label,
    @required this.onPressed,
  }) : assert(onPressed != null);
  //endregion

  //region UI
  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(12.0),
      elevation: 8.0,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(12.0),
        child: Container(
          height: 200.0,
          width: 160.0,
          decoration: BoxDecoration(
            // color: backgroundColor,
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Stack(
            children: <Widget>[
              Positioned(
                top: -10.0,
                left: -20.0,
                child: Icon(
                  icon,
                  size: 60.0,
                  color: foregroundColor,
                ),
              ),
              Positioned(
                left: 24.0,
                bottom: 10.0,
                child: Text(
                  label,
                  style: TextStyle(
                    color: foregroundColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  //endregion
}
