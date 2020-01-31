import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final Widget leading;
  final Widget title;
  final List<Widget> actions;
  final Color backgroundColor;

  //region Constructors
  CustomAppBar({
    this.height = 54.0,
    this.leading,
    this.title,
    this.actions = const [],
    this.backgroundColor = Colors.transparent,
  });
  //endregion

  //region Methods
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        color: Colors.transparent,
        child: Container(
          height: height,
          child: Row(
            children: <Widget>[
              _leading(context),
              SizedBox(width: 18.0),
              Expanded(
                child: Container(
                  height: height,
                ),
              ),
              Material(
                elevation: 4.0,
                color: Theme.of(context).primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    //topRight: Radius.circular(32.0),
                    bottomLeft: Radius.circular(32.0),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: _buildActions(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _leading(BuildContext context) {
    return Material(
      elevation: 8.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(32.0),
          bottomRight: Radius.circular(32.0),
        ),
      ),
      color: Theme.of(context).primaryColor,
      child: Row(
        children: <Widget>[
          Padding(padding: EdgeInsets.only(left: 16.0)),
          Material(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(32.0)),
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(32.0),
              child: leading,
            ),
          ),
          /* Material(
            color: Colors.transparent,
            child: InkWell(
              child: Padding(
                padding: EdgeInsets.only(left: 0.0),
                child: title,
              ),
            ),
          ),*/
          SizedBox(
            width: 16.0,
          )
        ],
      ),
    );
  }

  List<Widget> _buildActions(BuildContext context) {
    List<Widget> actions = [];
    if (this.actions.isEmpty || this.actions == null)
      actions.add(SizedBox(width: 0, height: 0));
    else {
      for (Widget action in this.actions) actions.add(action);

      actions.insert(0, Padding(padding: EdgeInsets.only(left: 16.0)));
      actions.add(Padding(padding: EdgeInsets.only(right: 16.0)));
    }
    return actions;
  }

  @override
  Size get preferredSize => Size(null, height);
  //endregion
}
