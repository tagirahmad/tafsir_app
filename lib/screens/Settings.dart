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
          title: Text("Настройки"),
        ),
        body: ListView(
            children: ListTile.divideTiles(
          context: context,
          tiles: [
            ListTile(
              title: Text("О приложении"),
              leading: Icon(Icons.assignment),
              onTap: () => {},
            ),
            ListTile(
              title: Text("Поделиться"),
              leading: Icon(Icons.share),
              onTap: () => {},
            ),
            ListTile(
              title: Text("Обратная связь"),
              leading: Icon(Icons.email),
              onTap: () => {},
            ),
            ListTile(
              title: Text("Другие приложения"),
              leading: Icon(Icons.grain),
              onTap: () => {},
            ),
            ListTile(
              title: Text("Оценить приложение"),
              leading: Icon(Icons.star),
              onTap: () => {},
            ),
          ],
        ).toList()));
  }
}
