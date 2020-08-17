// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:tafsir_albaqara/services/calls_messages_service.dart';
import 'package:tafsir_albaqara/statics/global_constants.dart';

class MaterialDialogs {
  static void showAboutAppDialog(BuildContext context) {
    showDialog<void>(
        context: context,
        builder: (_) => const AlertDialog(
              title: Text(GlobalConstants.aboutAppTitle),
              content: SingleChildScrollView(
                  child: Text(
                GlobalConstants.aboutApp,
                textAlign: TextAlign.center,
              )),
            ));
  }

  static void showFeedbackDialog(
      BuildContext context, CallsAndMessagesService service) {
    showDialog<void>(
        context: context,
        builder: (_) => AlertDialog(
              title: const Text(GlobalConstants.feedbackTitle),
              content: const Text(GlobalConstants.feedbackText),
              actions: <Widget>[
                FlatButton(
                    onPressed: () {
                      service.sendEmail(GlobalConstants.developerEmail);
                    },
                    child: const Text(GlobalConstants.tellAboutBug)),
                FlatButton(
                  child: const Text(GlobalConstants.close),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            ));
  }
}
