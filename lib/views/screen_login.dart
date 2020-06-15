import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:mbom_app/custom/custom_button.dart';
import 'package:mbom_app/custom/custom_flat_button_icon.dart';
import 'package:mbom_app/res/colors.dart';

import '../custom/custom_text_field.dart';
import '../res/Strings.dart';
import 'screen_base.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> implements ScreenAppBase {
  //#region Member(s)
  GlobalKey _formKey = GlobalKey<FormState>();
  //#endregion

  //#region
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white.withOpacity(0.97),
      appBar: buildAppbar(context),
      body: buildBody(context),
      resizeToAvoidBottomInset: false,
    );
  }
  //#endregion

  //#region ScreenAppBase Interface
  @override
  Widget buildAppbar(BuildContext context) {
    return AppBar(
      title: Image.asset(
        "assets/images/png/logo_h.png",
        scale: 1.75,
      ),
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
      height: double.maxFinite,
      //color: Colors.green,
      padding: EdgeInsets.symmetric(horizontal: 32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Flexible(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[],
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              //color: Colors.red,
              child: Form(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    CustomTextField(
                      hintText: Strings.txt_hint_username,
                      label: 'email',
                    ),
                    CustomTextField(
                      hintText: 'Mot de passe',
                      label: 'mot de passe',
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text('Mot de passe oublié ?'),
                          ),
                          onTap: () => _showPasswordResetModalWindow(context),
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 32.0),
                      child: RaisedButton(
                        onPressed: () {},
                        child: Text('se connecter'.toUpperCase()),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Flexible(
            child: FlatButton(
              onPressed: () => _navigateToSignUp(context),
              child: Text('Créez un compte'.toUpperCase()),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              //color: Colors.yellow,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          "OR",
                          style: Theme.of(context).textTheme.overline,
                        ),
                      ),
                    ),
                  ),
                  CustomButton(
                    onPressed: () {},
                    icon: Image.asset(
                      "assets/icons/google_g_logo_1024.png",
                      height: 24.0,
                    ),
                    label: "SIGN IN WITH GOOGLE",
                    borderColor: Colors.black54,
                  ),
                  CustomButton(
                    onPressed: () {},
                    icon: Image.asset(
                      "assets/icons/f_logo_RGB-Blue_512.png",
                      height: 24.0,
                    ),
                    label: "CONTINUE WITH FACEBOOK",
                    //color: AppColors.facebook,
                    textColor: AppColors.facebook,
                    borderColor: AppColors.facebook,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  //#endregion

  //#region UI
  Widget _passwordResetModalWindow() {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
            left: 24.0,
            top: 16.0,
            right: 24.0,
            bottom: 20.0,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(Strings.title_reset_password_modal_window,
                  style: Theme.of(context).textTheme.headline6),
              Padding(
                padding: EdgeInsets.only(top: 8.0, bottom: 24.0),
                child: Text(Strings.txt_reset_password_explanation),
              ),
              Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    CustomTextField(),
                    RaisedButton(
                      onPressed: () {},
                      child: Text(Strings.btn_reset_password.toUpperCase()),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
  //#endregion

  //#region UI Methods
  void _navigateToSignUp(BuildContext context) {
    Navigator.of(context).pushNamed('/sign_up');
  }

  void _showPasswordResetModalWindow(BuildContext context) {
    Navigator.of(context).pushNamed('/${Strings.title_pass_reset}');
    /*showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
          child: _passwordResetModalWindow(),
        );
      },
    );*/
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
