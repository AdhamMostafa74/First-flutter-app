import 'package:flutter/material.dart';
// import 'package:flutter_test/MainPage.dart';

import 'Ayahs.dart';
import 'Player.dart';

class TabViewPage extends StatelessWidget {


  Map sura = {
    'name' : '',
    'number' : 0,
    'ayahs' : [{
      'audio' : '',
      'text' : ''
    }],
  };

  TabViewPage(this.sura);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black12.withOpacity(0.8),
            bottom: TabBar(
              tabs: [
                Tab(
                  text: "الآيات",
                  icon: Icon(Icons.auto_stories),
                ),
                Tab(
                  text: "مشغل الصوت",
                  icon: Icon(Icons.multitrack_audio_rounded),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Ayahs(sura),
                Player(sura)
            ]
          ) ,
        )

    );

  }
}
