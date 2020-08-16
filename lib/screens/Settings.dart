// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:share/share.dart';
import 'package:store_redirect/store_redirect.dart';

// Project imports:
import 'package:tafsir_albaqara/services/calls_messages_service.dart';
import 'package:tafsir_albaqara/services/material_dialogs.dart';
import 'package:tafsir_albaqara/services/service_locator.dart';
import 'package:tafsir_albaqara/statics/global_constants.dart';

class Settings extends StatelessWidget {
  final CallsAndMessagesService _service = locator<CallsAndMessagesService>();
  @override
  Widget build(BuildContext context) {
    final List<ListTile> settingsItems = <ListTile>[
      ListTile(
        title: const Text(GlobalConstants.aboutAppTitle),
        leading: const Icon(Icons.assignment),
        onTap: () => MaterialDialogs.showAboutAppDialog(context),
      ),
      ListTile(
        title: const Text(GlobalConstants.share),
        leading: const Icon(Icons.share),
        onTap: () => Share.share(GlobalConstants.shareText),
      ),
      ListTile(
        title: const Text(GlobalConstants.feedbackTitle),
        leading: const Icon(Icons.email),
        onTap: () => MaterialDialogs.showFeedbackDialog(context, _service),
      ),
      ListTile(
        title: const Text(GlobalConstants.rateApp),
        leading: const Icon(Icons.star),
        onTap: () => StoreRedirect.redirect(
            androidAppId: GlobalConstants.androidAppID,
            iOSAppId: GlobalConstants.iosAppID),
      ),
    ];

    return Scaffold(
        appBar: AppBar(
          title: const Text(GlobalConstants.settings),
        ),
        body: ListView(
            children: ListTile.divideTiles(
                context: context,
                tiles: settingsItems.map((ListTile item) => item)).toList()));
  }
}
