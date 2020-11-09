import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: _dialogContent(context),
    );
  }

  _dialogContent(BuildContext context) {
    return Container(
        color: Colors.white,
        width: 300,
        height: 200,
        child: Stack(
          children: <Widget>[
            Align(
              child: Text('dialog content'),
              alignment: Alignment.center,
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: RaisedButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text('close'),
              ),
            )
          ],
        ));
  }
}
