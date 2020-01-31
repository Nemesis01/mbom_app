import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:mbom_app/models/category.dart';
import 'package:mbom_app/utils/string_formatter.dart';

class TabBarViewPage extends StatelessWidget {
  //region Field(s)
  final String title;
  final Category category;
  //final Widget child;
  //endregion

  //region Constructor
  TabBarViewPage({
    this.title,
    @required this.category,
    //@required this.child,
  });
  //endregion

  //region UI
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            automaticallyImplyLeading: false,
            leading: null,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                _buildCategoryNameText(context),
                Divider(thickness: 1.25, color: Colors.black),
              ],
            ),
          ),
          _buildSubCategoriesList(context),
        ],
      ),
    );
  }

  ///
  ///
  ///
  ///
  Widget _buildCategoryNameText(BuildContext context) => Text(
        //Capitalize
        StringFormatter.capitalize(category.name),
        style: TextStyle(letterSpacing: -0.75),
        //TextStyle(fontFamily: "EncodeSansCondensed"),
      );

  ///
  ///
  ///
  ///
  Widget _buildSubCategoriesList(BuildContext context) {
    return SliverGrid.count(
      crossAxisCount: 3,
      mainAxisSpacing: 8.0,
      crossAxisSpacing: 8.0,
      childAspectRatio: 0.8,
      children: List.generate(
        category.childrenCount,
        (index) => _Tile(
          label: category.subCategories[index].name,
          child: Icon(
            LineAwesomeIcons.picture_o,
            size: 66.0,
          ),
        ),
      ),
    );
  }
  //endregion

}

class _Tile extends StatelessWidget {
  //region Members
  final String label;
  final Widget child;
  //endregion

  //region Constructor
  _Tile({
    this.label,
    @required this.child,
  });
  //endregion

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      //elevation: 1.0,
      child: InkWell(
        child: Container(
          child: Column(
            children: <Widget>[
              SizedBox(width: 100.0, height: 100.0, child: child),
              Text(
                StringFormatter.capitalize(label),
                style: TextStyle(
                    fontFamily: "EncodeSansCondensed", fontSize: 14.0),
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        onTap: () {},
      ),
    );
  }
}
