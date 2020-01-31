import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:mbom_app/blocs/bloc_profile.dart';
import 'package:mbom_app/blocs/bloc_provider.dart';
import 'package:mbom_app/custom/custom_app_bar.dart';
import 'package:mbom_app/custom/custom_flat_button_icon.dart';
import 'package:mbom_app/custom/custom_text_tile.dart';
import 'package:mbom_app/views/screen_base.dart';

class ProfileScreen extends StatelessWidget implements ScreenAppBase {
  //region Fields
  final String title;
  //final User user;
  //endregion

  //region Constructor(s)
  ProfileScreen({
    Key key,
    this.title = 'Profile',
  }) : super(key: key);
  //endregion

  //region
  @override
  Widget build(BuildContext context) {
    return buildBody(context);
  }
  //endregion

  //region UI
  @override
  Widget landscape(BuildContext context) {
    // TODO: implement landscape
    return null;
  }

  @override
  Widget portrait(BuildContext context) {
    return Scaffold(
      //appBar: buildAppbar(context),
      body: _buildMainContent(context),
      //backgroundColor: Colors.white.withOpacity(0.98),
    );
  }

  @override
  Widget buildAppbar(BuildContext context) {
    return PreferredSize(
      preferredSize: Size(null, 54.0),
      child: CustomAppBar(
        // TODO: implements i18n
        leading: IconButton(
          icon: Icon(LineAwesomeIcons.angle_left),
          onPressed: () {
            Navigator.of(context).pop();
            // TODO: implements changes logic
          },
        ),
        title: Text(
          "",
          style: Theme.of(context).textTheme.title,
        ),
        actions: <Widget>[
          /*IconButton(
            icon: Icon(LineAwesomeIcons.edit),
            tooltip: 'Edit',
            onPressed: () {},
          ),*/
          IconButton(
            icon: Icon(LineAwesomeIcons.cog),
            tooltip: 'Settings',
            onPressed: () {
              Navigator.of(context).pushNamed("/settings");
            },
          )
        ],
      ),
    );

    /*return AppBar(
        leading: IconButton(
          icon: Icon(LineAwesomeIcons.arrow_left),
          onPressed: () => Navigator.of(context).pop(),
        ),
        // TODO: implement i18n
        title: Text(title));*/
  }

  @override
  Widget buildBody(BuildContext context) {
    // Getting device size and resolution in order to build responsive UI
    Size size = MediaQuery.of(context).size;
    Orientation orientation = MediaQuery.of(context).orientation;
    return size.width < 600 ? portrait(context) : landscape(context);
  }

  Widget _buildMainContent(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: true,
      child: Stack(
        children: <Widget>[
          CustomScrollView(
            slivers: <Widget>[
              SliverPadding(
                padding: EdgeInsets.only(top: 70.0, bottom: 0.0),
                sliver: SliverToBoxAdapter(
                  child: _profilePicture(context),
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 10.0),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    _dashboard(context),
                    _premiumFeaturesUnlocker(context),
                    //_options(context),
                  ]),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  height: 200.0,
                  child: _options(context),
                ),
              ),
            ],
          ),
          buildAppbar(context),
        ],
      ),
    );
  }

  Widget _profilePicture(BuildContext context) {
    final bloc = BlocProvider.of<ProfileBloc>(context);

    return StreamBuilder<Object>(
        stream: bloc.usernameObservable,
        builder: (context, snapshot) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                height: 150.0,
                width: 150.0,
                decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(24.0),
                  ),
                ),
                child: Icon(
                  LineAwesomeIcons.camera_retro,
                  size: 60.0,
                ),
              ),
              Text(
                '${snapshot.data}',
                style: Theme.of(context)
                    .textTheme
                    .display1
                    .copyWith(fontSize: 28.0, letterSpacing: -1.0),
              )
            ],
          );
        });
  }

  Widget _dashboard(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          CustomFlatIconButton(
            icon: LineAwesomeIcons.bookmark_o,
            text: "0",
            label: "lists",
            onPressed: () {},
          ),
          CustomFlatIconButton(
            icon: LineAwesomeIcons.heart_o,
            text: "0",
            label: "favorites",
            onPressed: () {},
          ),
          CustomFlatIconButton(
            icon: LineAwesomeIcons.shopping_cart,
            text: "0",
            label: "cart",
            onPressed: () {},
          ),
          CustomFlatIconButton(
            icon: LineAwesomeIcons.users,
            text: "0",
            label: "followers",
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _premiumFeaturesUnlocker(BuildContext context) {
    return Visibility(
      visible: true,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Material(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          elevation: 4.0,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.0),
            ),
            height: 90.0,
            child: Center(
              child: Text(
                'Promote your products, unlock premium features',
                style: TextStyle(fontSize: 18.0),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _options(BuildContext context) {
    final List<IconData> _icons = [
      LineAwesomeIcons.trophy,
      LineAwesomeIcons.star_o,
      LineAwesomeIcons.thumbs_o_up
    ];

    final List<Color> _colors = [
      Theme.of(context).primaryColor,
      Theme.of(context).accentColor,
    ];

    Random generator = new Random();
    final _backgroundColor = _colors[generator.nextInt(1)];
    final _foregroundColor =
        (_backgroundColor == _colors[0]) ? _colors[1] : _colors[0];

    // ScrollConfiguration is used here to remove GlowingOverscrollIndicator
    return ScrollConfiguration(
      behavior: ScrollBehavior(),
      child: ListView.builder(
        padding: EdgeInsets.only(left: 32.0, bottom: 25.0),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: _icons.length,
        itemBuilder: (context, index) {
          Color _backgroundColor = (index == 0)
              ? Theme.of(context).accentColor
              : Theme.of(context).primaryColor;
          Color _foregroundColor =
              (_backgroundColor == Theme.of(context).primaryColor)
                  ? Colors.deepPurple.shade300
                  : Colors.deepPurple.shade50;

          return Container(
            margin: EdgeInsets.only(right: 12.0),
            child: CustomTextTile(
              backgroundColor: _backgroundColor,
              foregroundColor: _foregroundColor,
              icon: _icons[index],
              label: 'label',
              onPressed: () {},
            ),
          );
        },
      ),
    );
  }
  //endregion

}
