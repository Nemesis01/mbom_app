import 'package:flutter/material.dart';
import 'package:mbom_app/custom/custom_dialog.dart';

import 'package:mbom_app/res/Strings.dart';

import 'package:mbom_app/custom/custom_text_field.dart';

class PasswordResetScreen extends StatefulWidget {
  @override
  _PasswordResetScreenState createState() => _PasswordResetScreenState();
}

class _PasswordResetScreenState extends State<PasswordResetScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //title: Text(Strings.title_pass_reset),
        title: Image.asset(
          'assets/images/png/logo_h.png',
          scale: 2.00,
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 32.0),
        child: Column(
          children: <Widget>[
            Flexible(flex: 1, child: Container()),
            Expanded(
              flex: 2,
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: Text(
                      Strings.title_pass_reset,
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ),
                  Text(Strings.txt_password_reset_explanation),
                  Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        CustomTextField(),
                        RaisedButton(
                          onPressed: () => _showConfirmationDialog(context),
                          child: Text('CONTINUE'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  //#region UI
  void _showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) => CustomDialog(
        type: DialogType.ROUTING,
        title: "Success",
        description: "An email has been sent to your email account",
        onConfirm: () {},
      ),
    );
  }
  //#endregion
}
