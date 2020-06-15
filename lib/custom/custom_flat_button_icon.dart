import 'package:flutter/material.dart';

class CustomFlatIconButton extends StatelessWidget {
  //region Members
  final String label;
  final IconData icon;
  final String text;
  final VoidCallback onPressed;
  //endregion

  //region Constructor(s)
  CustomFlatIconButton({
    @required this.label,
    @required this.icon,
    @required this.text,
    @required this.onPressed,
  }) : assert(onPressed != null);
  //endregion

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100.0)),
      child: InkWell(
        onTap: onPressed,
        radius: 50.0,
        borderRadius: BorderRadius.circular(100.0),
        child: Container(
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Icon(
                icon,
                size: 72.0,
                color: Theme.of(context).accentColor.withOpacity(0.08),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  //Text(text, style: Theme.of(context).textTheme.title),
                  Text(label,
                      style: Theme.of(context).textTheme.subtitle.copyWith(
                          fontWeight: FontWeight.w700, color: Colors.grey)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
