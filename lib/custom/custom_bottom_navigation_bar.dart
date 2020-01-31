import 'package:flutter/material.dart';

//TODO: Add hoverColor and take in count web app
class CustomBottomNavigationBar extends StatelessWidget {
  //region Field(s)
  final List<CustomBottomNavigationBarItem> items;
  final ValueChanged<int> onTap;
  final int currentIndex;
  final double elevation;
  final Color color;
  final Color backgroundColor;
  final Color selectedItemColor;
  //endregion

  //region Constructor(s)
  CustomBottomNavigationBar({
    @required this.items,
    @required this.onTap,
    this.currentIndex = 0,
    this.elevation = 4.0,
    this.color = Colors.black87,
    this.backgroundColor,
    this.selectedItemColor = Colors.deepPurple,
  })  : assert(items != null),
        assert(onTap != null),
        assert(items.length % 2 == 0);
  //endregion

  @override
  Widget build(BuildContext context) {
    return Material(
      //elevation: 16.0,
      color: Colors.transparent,
      child: Container(
        height: 54.0,
        //color: Colors.white,
        child: Row(
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: buildItems(context),
        ),
      ),
    );
  }

  Widget buildItem(
    BuildContext context,
    int index,
    IconData icon,
    String label,
  ) {
    return Expanded(
      flex: 2,
      child: CustomBottomNavigationBarItem(
        icon: icon,
        label: label,
        color: index == currentIndex ? selectedItemColor : color,
        selected: index == currentIndex ? true : false,
        onTap: () => onTap(index),
      ),
    );
  }

  List<Widget> buildItems(BuildContext context) {
    List<Widget> _items = List.generate(
      items.length,
      (index) {
        if (items.length == 4)
          return buildItem(
              context, index, items[index].icon, items[index].label);
        return buildItem(context, index, items[index].icon, items[index].label);
      },
    );

    _items.length == 2
        ? _items.insert(1, Expanded(child: Container(), flex: 2))
        : _items.insert(2, Expanded(child: Container(), flex: 1));
    return _items;
  }
}

class CustomBottomNavigationBarItem extends StatelessWidget {
  //region Field(s)
  final IconData icon;
  final String label;
  final Color color;
  final bool selected;
  final VoidCallback onTap;
  //endregion

  //region Constructor(s)
  CustomBottomNavigationBarItem({
    @required this.icon,
    @required this.label,
    this.color,
    this.selected = false,
    this.onTap,
  });
  //endregion

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: 54.0,
        width: 54.0,
        padding: EdgeInsets.symmetric(vertical: 4.0),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(icon, color: color, size: 28.0),
            Text(label, style: TextStyle(color: color)),
            //indicator(context),
          ],
        ),
      ),
      onTap: onTap,
      borderRadius: BorderRadius.circular(18.0),
    );
  }

  Widget indicator(BuildContext context) {
    return Container(
      height: 4.0,
      width: 4.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          color: selected ? color : Colors.transparent),
    );
  }
}
