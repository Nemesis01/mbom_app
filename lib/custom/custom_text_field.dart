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
                  decoration: InputDecoration(
                      hintText: hintText,
                      hintStyle: TextStyle(
                        fontSize: 20.0,
                      ),
                      filled: true,
                      fillColor: Color(0xff512da8).withOpacity(0.03),
                      focusColor: Color(0xff512da8).withOpacity(0.05),
                      hoverColor: Color(0xff512da8).withOpacity(0.05),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: EdgeInsets.only(left: 4.0)),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4.0, bottom: 8.0),
                  child: Text(
                    label.toUpperCase(),
                    style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.40,
                      color: Colors.deepPurple.shade800,
                    ),
                  ),
                ),
              ],
            );
          },
        );
}
