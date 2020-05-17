import 'package:flutter/material.dart';

import 'screen_base.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> implements ScreenAppBase {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(context),
    );
  }

  @override
  Widget buildAppbar(BuildContext context) {
    // TODO: implement buildAppbar
    throw UnimplementedError();
  }

  @override
  Widget buildBody(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;

    return _screenWidth > 600.0 ? landscape(context): portrait(context);
  }

  @override
  Widget landscape(BuildContext context) {
    // TODO: implement landscape
    throw UnimplementedError();
  }

  @override
  Widget portrait(BuildContext context) {
    return Container();
  }

}