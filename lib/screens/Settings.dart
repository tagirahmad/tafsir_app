import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Настройки'),
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
              onTap: () => <dynamic>{},
            ),
            ListTile(
              title: const Text('Обратная связь'),
              leading: const Icon(Icons.email),
              onTap: () => <dynamic>{},
            ),
            ListTile(
              title: const Text('Другие приложения'),
              leading: const Icon(Icons.grain),
              onTap: () => <dynamic>{},
            ),
            ListTile(
              title: const Text('Оценить приложение'),
              leading: const Icon(Icons.star),
              onTap: () => <dynamic>{},
            ),
          ],
        ).toList()));
  }
}
