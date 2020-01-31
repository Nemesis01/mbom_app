import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:mbom_app/custom/custom_app_bar.dart';
import 'package:mbom_app/views/screen_base.dart';

class PreferencesScreen extends StatelessWidget implements ScreenAppBase {
  //region UI
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(context),
    );
  }

  @override
  Widget buildAppbar(BuildContext context) {
    return CustomAppBar(
      leading: IconButton(
        icon: Icon(LineAwesomeIcons.angle_left),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }

  @override
  Widget buildBody(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return _width < 600 ? portrait(context) : landscape(context);
  }

  @override
  Widget landscape(BuildContext context) {
    // TODO: implement landscape
    throw UnimplementedError();
  }

  @override
  Widget portrait(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: <Widget>[
          _backLayer(context),
          _frontLayer(context),
          // Text('Settings Screen'),
          buildAppbar(context),
        ],
      ),
    );
  }

  Widget _backLayer(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(),
        Positioned(
          right: -60.0,
          child: Icon(
            LineAwesomeIcons.cogs,
            size: 250.0,
            color: Colors.deepPurple.shade50,
          ),
        ),
      ],
    );
  }

  Widget _frontLayer(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: _profilePicture(context),
          ),
        ),
        SliverFillRemaining(),
      ],
    );
  }

  Widget _profilePicture(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Material(
          elevation: 8.0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100.0)),
          // color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(100.0),
            //splashColor: Colors.red,
            child: CircleAvatar(
              radius: 60.0,
              backgroundColor: Colors.transparent,
              child: Icon(
                LineAwesomeIcons.camera,
                size: 50.0,
              ),
            ),
            onTap: () {},
          ),
        ),
      ],
    );
  }

  Widget _settingsList(BuildContext context) {
    return Container();
  }
  //endregion

}
