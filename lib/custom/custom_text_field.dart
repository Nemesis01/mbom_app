import 'package:flutter/material.dart';

enum TextFieldType {
  NAME,
  ADDRESS,
  E_MAIL,
  PHONE_NUMBER,
  PASSWORD,
  SWITCHER,
}

class CustomTextField extends StatelessWidget {
  //region Field(s)
  final TextFieldType type;
  final TextEditingController controller;
  final height;
  final String text;
  final String label;
  final String initialValue;
  final bool showCounter;
  final bool isSwitched;
  final ValueChanged<bool> onChanged;
  final Widget background;
  //endregion

  //region Constructor(s)
  CustomTextField({
    @required this.label,
    this.type = TextFieldType.NAME,
    this.height = 100.0,
    this.controller,
    this.text,
    this.initialValue,
    this.showCounter = false,
    this.isSwitched,
    this.onChanged,
    this.background,
  }) : /*assert(hintText != null),*/
        assert(label != null);
  //endregion

  //region UI
  @override
  Widget build(BuildContext context) {
    final style = TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.w400,
      color: Colors.black,
      /*fontFamily: "EncodeSansCondensed"*/
    );

    return (type == TextFieldType.SWITCHER)
        ? Container(
            height: height,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        TextFormField(
                          decoration: InputDecoration.collapsed(
                            hintText: text,
                            hintStyle: style,
                            hoverColor: Colors.deepPurple,
                          ),
                          enabled: false,
                          style: style,
                          textCapitalization: type == TextFieldType.NAME
                              ? TextCapitalization.words
                              : TextCapitalization.none,
                          obscureText:
                              type == TextFieldType.PASSWORD ? true : false,
                          initialValue: initialValue,
                        ),
                        SizedBox(height: 8.0),
                        Row(
                          children: <Widget>[
                            Text(
                              label.toUpperCase(),
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle
                                  .copyWith(
                                      fontSize: 14, color: Colors.black54),
                            ),
                            Expanded(
                              child: Visibility(
                                visible: showCounter,
                                child: Text(
                                  type == TextFieldType.NAME
                                      ? 'controller.text.length / 32'
                                      : '',
                                  textAlign: TextAlign.end,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Switch(
                    value: true,
                    onChanged: onChanged,
                    activeTrackColor: Theme.of(context).accentColor,
                    //activeThumbImage: ImageIcon(Image),
                  )
                ],
              ),
            ),
          )
        : Container(
            //height: height,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration.collapsed(
                      hintText: text,
                      hintStyle: style,
                      enabled: true,
                      hoverColor: Colors.deepPurple,
                    ),
                    style: style,
                    textCapitalization: type == TextFieldType.NAME
                        ? TextCapitalization.words
                        : TextCapitalization.none,
                    obscureText: type == TextFieldType.PASSWORD ? true : false,
                    initialValue: initialValue,
                    keyboardType: type == TextFieldType.PHONE_NUMBER
                        ? TextInputType.phone
                        : type == TextFieldType.E_MAIL
                            ? TextInputType.emailAddress
                            : TextInputType.text,
                  ),
                  SizedBox(height: 0.0),
                  Row(
                    children: <Widget>[
                      Text(
                        label.toUpperCase(),
                        style: Theme.of(context)
                            .textTheme
                            .subtitle
                            .copyWith(fontSize: 12, color: Colors.black54),
                      ),
                      Expanded(
                        child: Visibility(
                          visible: showCounter,
                          child: Text(
                            type == TextFieldType.NAME
                                ? 'controller.text.length / 32'
                                : '',
                            textAlign: TextAlign.end,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
  }
  //endregion
}
