import 'package:flutter/material.dart';

import 'package:mbom_app/res/dimens.dart';

enum DialogType { ACKNOWLEGMENT, DISMISSIVE, CONFIRMING, ROUTING }

class CustomDialog extends StatelessWidget {
  //#region Member(s)
  final DialogType type;
  final String title, description;
  final String dismissText, ackowledgmentText, confirmText;
  final VoidCallback onDismiss, onAcknowledge, onConfirm;
  //final List<DialogAction> actions;
  //#endregion

  //#region Constructor(s)
  CustomDialog({
    @required this.type,
    @required this.title,
    @required this.description,
    this.dismissText = "CANCEL",
    this.ackowledgmentText = "GOT IT",
    this.confirmText = "AGREE",
    this.onDismiss,
    this.onAcknowledge,
    this.onConfirm,
  });
  //#endregion

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
            Dimens.dialog_rounded_rectangle_border_radius),
      ),
      child: Container(
        padding: EdgeInsets.only(
          left: Dimens.dialog_padding_left,
          top: Dimens.dialog_padding_top,
          right: Dimens.dialog_padding_right,
          // bottom: Dimens.dialog_padding_bottom,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: 40.0,
              child: Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(fontWeight: FontWeight.w600),
                textAlign: TextAlign.start,
              ),
            ),
            Text(description, style: Theme.of(context).textTheme.bodyText2),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: ButtonBar(
                children: _buildButtonBarItems(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildButtonBarItems() {
    switch (type) {
      case DialogType.ACKNOWLEGMENT:
        return [
          FlatButton(
            onPressed: onAcknowledge,
            child: Text(ackowledgmentText),
          )
        ];
        break;
      case DialogType.DISMISSIVE:
        return [
          FlatButton(
            onPressed: onDismiss,
            child: Text(dismissText),
          )
        ];
        break;
      case DialogType.CONFIRMING:
        return [
          FlatButton(
            onPressed: onDismiss,
            child: Text(dismissText),
          ),
          FlatButton(
            onPressed: onConfirm,
            child: Text(confirmText),
          )
        ];
        break;
      case DialogType.ROUTING:
        return [
          FlatButton(
            onPressed: onDismiss,
            child: Text(ackowledgmentText),
          ),
          FlatButton(
            onPressed: onConfirm,
            child: Text(confirmText),
          ),
        ];
        break;
      default:
        return [];
        break;
    }
  }
}
