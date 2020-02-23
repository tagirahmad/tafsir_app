import 'dart:convert';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'package:tafsir_albaqara/screens/ContentPage.dart';
import 'package:tafsir_albaqara/screens/settings.dart';
import 'package:tafsir_albaqara/ui/DynamicThemeIconButton.dart';
import 'package:tafsir_albaqara/ui/SettingsIconButton.dart';

class ListOfContent extends StatelessWidget {
  Future<String> loadAsset() async {
    return await rootBundle.loadString('lib/content/content.json');
  }

  List data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Список глав'),
        actions: <Widget>[
          DynamicThemeIconButton(),
          SettingsIconButton()
        ],
      ),
      body: Container(
        child: Center(
          child: FutureBuilder(
            future: DefaultAssetBundle.of(context)
                .loadString('assets/content.json'),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return CircularProgressIndicator();
              }
              var myData = json.decode(snapshot.data);
              return ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: <Widget>[
                      Card(
                          child: ListTile(
                          title: Text('${myData[index]['chapter']}'),
                          subtitle: Text('${myData[index]['title']}', textAlign: TextAlign.left,),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PageContent(
                                    text: myData[index]['text'],
                                    title:myData[index]['title'],
                                    chapter: myData[index]['chapter'], 
                                  )
                                )
                              );
                            },
                          
                        ),
                      ),
                    ],
                  );
                },
                itemCount: myData == null ? 0 : myData.length,
              );
            },
          ),
        ),
      ),
    );
  }
}
