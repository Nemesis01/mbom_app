import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:line_icons/line_icons.dart';
import 'package:mbom_app/blocs/bloc_categories.dart';
import 'package:mbom_app/blocs/bloc_provider.dart';
import 'package:mbom_app/custom/search_bar.dart';
import 'package:mbom_app/models/category.dart';
import 'package:mbom_app/views/page_tab_bar_view.dart';

class CategoriesScreen extends StatelessWidget {
  //region Field(s)
  final String title;
  //endregion

  //region Constructor(s)
  CategoriesScreen({this.title = "Catégories"});
  //endregion

  @override
  Widget build(BuildContext context) {
    final CategoriesBloc bloc = BlocProvider.of<CategoriesBloc>(context);

    return StreamBuilder(
      stream: bloc.categories,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        int _tabsCount = (snapshot.data as List<Category>).length;
        return DefaultTabController(
          length: _tabsCount,
          child: Scaffold(
            appBar: _buildAppBar(context, snapshot.data),
            body: _buildTabBarView(context, snapshot.data),
          ),
        );
      },
    );
  }

  Widget _buildAppBar(BuildContext context, List<Category> categories) {
    return AppBar(
      elevation: 0.0,
      leading: Padding(
        padding: EdgeInsets.only(left: 8.0),
        child: IconButton(
          icon: Icon(LineAwesomeIcons.angle_left),
          onPressed: () => Navigator.pop(context),
          tooltip: 'Back',
        ),
      ),
      title: SearchBar(text: title),
      titleSpacing: 10.0,
      actions: <Widget>[
        SizedBox(
          //width: 48.0,
          child: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              icon: Icon(LineAwesomeIcons.camera_retro, size: 28.0),
              onPressed: () {},
              tooltip: 'Camera',
            ),
          ),
        )
      ],
      //title: Text(title),
      //backgroundColor: Theme.of(context).accentColor.withOpacity(0.84),
      //brightness: Brightness.dark,
      //iconTheme: IconThemeData(color: Theme.of(context).primaryColor),

      //Theme.of(context).primaryColor.withOpacity(0.5),
      bottom: _buildTabBar(context, categories),
    );
  }

  Widget _buildTabBar(BuildContext context, List<Category> categories) {
    //
    final _icons = [
      LineIcons.mobile_phone,
      LineIcons.tablet,
      LineIcons.desktop,
      LineIcons.laptop,
      LineIcons.headphones,
      LineIcons.child
    ];

    return TabBar(
      //indicatorColor: Theme.of(context).primaryColor,
      //labelColor: Colors.white,
      tabs: List.generate(
        categories.length,
        (index) => Tab(icon: Icon(_icons[index])),
      ),
      //isScrollable: true,
    );
  }

  Widget _buildTabBarView(BuildContext context, List<Category> categories) {
    final _style = Theme.of(context)
        .textTheme
        .display1
        .copyWith(fontFamily: "EncodeSansCondensed", fontSize: 18.0);

    return TabBarView(
      children: List.generate(
        categories.length,
        (index) {
          Category cat = categories[index];
          return TabBarViewPage(
            title: cat.name,
            category: cat,
          );
        },
      ),
    );
  }
}
