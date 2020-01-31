import 'package:flutter/material.dart';
import 'package:mbom_app/utils/string_formatter.dart';

class CustomListTile extends StatelessWidget {
  //region Members
  final String title;
  final String subtitle;
  final Color backgroundColor;
  final VoidCallback onTap;
  //endregion

  //region Constructor
  CustomListTile({
    @required this.title,
    this.subtitle,
    @required this.onTap,
    this.backgroundColor = Colors.white,
  })  : assert(title != null),
        assert(subtitle != null),
        assert(onTap != null);
  //endregion

  @override
  Widget build(BuildContext context) {
    // Colors
    Color _textColor = (backgroundColor == Theme.of(context).primaryColor)
        ? Colors.black //Theme.of(context).accentColor.withOpacity(0.54)
        : Theme.of(context).primaryColor;

    return Material(
      borderRadius: BorderRadius.circular(24.0),
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 100.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24.0),
          ),
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                StringFormatter.capitalize(title),
                style: TextStyle(
                  fontSize: 20.0,
                  color: _textColor.withOpacity(.90),
                ),
              ),
              Text(
                subtitle,
                style: TextStyle(color: _textColor, fontSize: 14.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
