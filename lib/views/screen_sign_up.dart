import 'package:flutter/material.dart';

import 'package:mbom_app/res/Strings.dart';
import 'package:mbom_app/custom/custom_text_field.dart';

import 'package:mbom_app/views/screen_base.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> implements ScreenAppBase {
  //#region Member(s)
  final GlobalKey _signUpForm = GlobalKey<FormState>();
  bool _isEnabled = false;
  //#endregion

  //#region Lifecycle Method(s)
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar(context),
      body: buildBody(context),
    );
  }
  //#endregion

  //#region UI Methods
  @override
  Widget buildAppbar(BuildContext context) {
    return AppBar(
      leading: null,
      automaticallyImplyLeading: false,
      title: Text(
        Strings.txt_sign_up,
        style: Theme.of(context).textTheme.headline4.copyWith(
              color: Colors.deepPurple.shade50,
            ),
      ),
      actions: <Widget>[BackButton(color: Colors.deepPurple)],
      elevation: 0.0,
      brightness: Brightness.light,
    );
  }

  @override
  Widget buildBody(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;

    return _screenWidth > 600.0 ? landscape(context) : portrait(context);
  }

  @override
  Widget landscape(BuildContext context) {
    return Container();
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  Strings.app_name.toLowerCase(),
                  style: Theme.of(context).textTheme.headline3.copyWith(
                        fontSize: 40.0,
                        color: Colors.black,
                        letterSpacing: -2.0,
                        height: 0.05,
                      ),
                ),
                Text(
                  'Deals',
                  style: Theme.of(context).textTheme.headline4.copyWith(
                        color: Color(0xff512da8),
                        fontSize: 30.0,
                        //letterSpacing: 6.0,
                      ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              height: 400.0,
              child: Form(
                key: _signUpForm,
                child: ListView(
                  shrinkWrap: true,
                  // mainAxisSize: MainAxisSize.min,
                  //crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        CustomTextField(
                          hintText: 'Username',
                          label: 'Username',
                        ),
                        CustomTextField(
                          hintText: 'Votre adresse électronique ici',
                          label: 'email',
                        ),
                        CustomTextField(
                          hintText: 'Mot de passe',
                          label: 'mot de passe',
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 32.0),
                      child: RaisedButton(
                        onPressed: _isEnabled == true ? () {} : null,
                        child: Text('se connecter'.toUpperCase()),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                    ),
                    Flexible(
                      child: FlatButton(
                          onPressed: () {},
                          child: Text('Créez un compte'.toUpperCase()),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          )),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Text(
                              Strings.txt_agree,
                              style: TextStyle(
                                fontSize: 11.0,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Material(
                                  child: InkWell(
                                    onTap: () {
                                      showModal(context,
                                          Strings.txt_terms_of_service, "");
                                    },
                                    child: Text(
                                      Strings.txt_terms_of_service,
                                      style: TextStyle(
                                          color: Color(0xff512da8),
                                          fontSize: 11.0,
                                          fontWeight: FontWeight.w500,
                                          decoration: TextDecoration.underline),
                                    ),
                                  ),
                                ),
                                Text(
                                  ' and ',
                                  style: TextStyle(
                                    fontSize: 11.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Material(
                                  child: InkWell(
                                    onTap: () {
                                      showModal(
                                        context,
                                        Strings.txt_privacy_policy,
                                        "",
                                      );
                                    },
                                    child: Text(
                                      Strings.txt_privacy_policy,
                                      style: TextStyle(
                                        color: Color(0xff512da8),
                                        fontSize: 11.0,
                                        fontWeight: FontWeight.w500,
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                  ),
                                ),
                                Text('.')
                              ],
                            ),
                          ],
                        ),
                      ),
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
  //#enregion

  //#region UI Methods
  void _navigateToSignIn(BuildContext context) {
    Navigator.of(context).pushNamed('/sign_up');
  }

  void showModal(BuildContext context, String title, String content) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Container(
            padding: EdgeInsets.only(
                left: 24.0, top: 20.0, right: 24.0, bottom: 24.0),
            //child: Text(title),
          ),
        );
      },
    );
  }
  //#endregion

}
