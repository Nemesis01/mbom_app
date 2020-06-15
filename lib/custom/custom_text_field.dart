import 'package:flutter/material.dart';

enum TextFieldType {
  NAME,
  ADDRESS,
  E_MAIL,
  PHONE_NUMBER,
  PASSWORD,
  SWITCHER,
}

class CustomTextField extends FormField<String> {
  final FormFieldSetter<String> onSaved;
  final FormFieldValidator<String> validator;
  final String initialValue;
  final bool autovalidate;

  final String label;
  final String hintText;

  CustomTextField({
    this.onSaved,
    this.validator,
    this.initialValue,
    this.autovalidate = false,
    this.label = "label",
    this.hintText = "hintText",
  }) : super(
          onSaved: onSaved,
          validator: validator,
          initialValue: initialValue,
          autovalidate: autovalidate,
          builder: (state) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                TextField(
                  decoration: InputDecoration.collapsed(
                    hintText: hintText,
                    hintStyle: TextStyle(
                      //fontFamily: 'EncodeSansCondensed',
                      fontSize: 20.0,
                    ),
                    //filled: true,
                    // fillColor: Colors.black12.withOpacity(0.01),
                  ),
                ),
                Text(
                  label.toUpperCase(),
                  style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.40,
                    //color: Colors.deepPurple,
                  ),
                ),
              ],
            );
          },
        );
}
