import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:tafsir_albaqara/services/calls_messages_service.dart';
import 'package:tafsir_albaqara/services/service_locator.dart';
import 'package:tafsir_albaqara/services/store_redirect.dart';
import 'package:tafsir_albaqara/statics/global_constants.dart';

class Settings extends StatelessWidget {
  final CallsAndMessagesService _service = locator<CallsAndMessagesService>();

  @override
  Widget build(BuildContext context) {
    void _showMaterialDialog() {
      showDialog<void>(
          context: context,
          builder: (_) => AlertDialog(
                title: const Text(GlobalConstants.feedbackTitle),
                content: const Text(GlobalConstants.feedbackText),
                actions: <Widget>[
                  FlatButton(
                      onPressed: () {
                        _service.sendEmail(GlobalConstants.developerEmail);
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

    return Scaffold(
        appBar: AppBar(
          title: const Text(GlobalConstants.settings),
        ),
        body: ListView(
            children: ListTile.divideTiles(
          context: context,
          tiles: <ListTile>[
            ListTile(
              title: const Text('О приложении'),
              leading: const Icon(Icons.assignment),
              onTap: () => <dynamic>{},
            ),
            ListTile(
              title: const Text('Поделиться'),
              leading: const Icon(Icons.share),
              onTap: () =>
                  Share.share('check out my website https://example.com'),
            ),
            ListTile(
              title: const Text('Обратная связь'),
              leading: const Icon(Icons.email),
              onTap: () => _showMaterialDialog(),
            ),
            // ListTile(
            //   title: const Text('Другие приложения'),
            //   leading: const Icon(Icons.grain),
            //   onTap: () => <dynamic>{},
            // ),
            ListTile(
              title: const Text('Оценить приложение'),
              leading: const Icon(Icons.star),
              onTap: () => StoreRedirect.redirect(androidAppId: 'com.abumaliksoft.kitabattauhid'),
            ),
          ],
        ).toList()));
  }
}
