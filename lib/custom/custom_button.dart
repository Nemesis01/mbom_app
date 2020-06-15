import "package:flutter/material.dart";

class CustomButton extends StatelessWidget {
  //#region Field(s)
  final Widget icon;
  final String label;
  final VoidCallback onPressed;
  final Color color;
  final Color textColor;
  final Color borderColor;
  //#endregion

  //#region Constructor(s)
  CustomButton({
    this.icon,
    @required this.label,
    @required this.onPressed,
    this.color = Colors.white,
    this.textColor,
    this.borderColor = Colors.white,
  });
  //#endregion

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: color,
      onPressed: onPressed,
      elevation: 0.0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
          side: BorderSide(color: borderColor)),
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 24.0),
            child: icon ?? Material(),
          ),
          Text(
            label,
            style: Theme.of(context)
                .textTheme
                .button
                .copyWith(fontWeight: FontWeight.w600, color: textColor),
          ),
        ],
      ),
    );
  }
}
