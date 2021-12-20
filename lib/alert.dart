import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
// import 'styles/text_style.dart';

class QuizlerAlert {
  void showAlert(BuildContext context, String content,
      {VoidCallback? onPressed}) {
    Alert(
      context: context,
      desc: content,
      // buttons: [
      //   DialogButton(
      //     child: Text('Reset quiz', style: heeboFontStyle()),
      //     onPressed: onPressed,
      //   )
      // ],
    ).show();
  }
}
