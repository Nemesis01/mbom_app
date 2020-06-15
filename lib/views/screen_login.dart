import 'package:flutter/material.dart';

import '../custom/custom_text_field.dart';
import '../res/Strings.dart';
import 'screen_base.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> implements ScreenAppBase {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar(context),
      body: buildBody(context),
    );
  }

  @override
  Widget buildAppbar(BuildContext context) {
    return AppBar(
      title: Text('Login'),
      elevation: 0.0,
    );
  }

  @override
  Widget buildBody(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;

    return _screenWidth > 600.0 ? portrait(context) : portrait(context);
  }

  @override
  Widget landscape(BuildContext context) {
    // TODO: implement landscape
    throw UnimplementedError();
  }

  @override
  Widget portrait(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 32.0),
      child: Column(
        children: <Widget>[
          Flexible(
            flex: 2,
            child: Column(
              children: <Widget>[
                Text(
                  Strings.app_name.toLowerCase(),
                  style: Theme.of(context).textTheme.headline3,
                ),
                Text(
                  'Deals',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              child: Form(
                child: Column(
                  //shrinkWrap: true,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    CustomTextField(
                      hintText: 'Votre adresse électronique ici',
                      label: 'email',
                    ),
                    CustomTextField(
                      hintText: 'Mot de passe',
                      label: 'mot de passe',
                    ),
                    Material(
                      child: InkWell(
                        child: Row(
                          children: <Widget>[
                            Expanded(child: Container()),
                            Text('Mot de passe oublié ?'),
                          ],
                        ),
                        onTap: () {},
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 32.0),
                      child: RaisedButton(
                        onPressed: () {},
                        child: Text('se connecter'.toUpperCase()),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                    ),
                    Text(
                      'Terms of service and Privacy policy Agreeing',
                      style: TextStyle(fontSize: 10.0),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
