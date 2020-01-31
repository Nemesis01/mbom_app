import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';

class SearchBar extends StatelessWidget {
  //region Member(s)
  final String text;
  final Color backgroundColor;
  final Color color;
  //endregion

  //region Constructor
  SearchBar({this.text, this.backgroundColor, this.color});
  //endregion

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.0),
        color: Colors.white.withOpacity(0.95),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              LineAwesomeIcons.search,
              size: 24.0,
            ),
          ),
          Expanded(
            child: TextField(
              textAlignVertical: TextAlignVertical.top,
              decoration: InputDecoration.collapsed(hintText: text),
            ),
          ),
        ],
      ),
    );
  }
}
