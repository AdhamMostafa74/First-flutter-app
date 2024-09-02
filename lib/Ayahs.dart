import 'package:flutter/material.dart';
class Ayahs extends StatelessWidget {
  Map sura = {
    'name' : "سُورَةُ ٱلْفَاتِحَةِ",
    'number' : 0,
    'ayahs' : [{
      'number' :0,
      'audio' : '',
      'text' : '',
      'numberInSurah' : 0

    }],
};
  late List name = sura['name'];
  late List ayatLength = sura["ayahs"];
  late int ayat =sura["ayahs"][0]["numberInSurah"];
  Ayahs(this.sura);

  @override
  Widget build(BuildContext context) {
    return Container(

      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
          for(int i = 0 ; i<ayatLength.length; i++)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(("${sura['ayahs'][i]['text'].toString()} ${sura['ayahs'][i]['numberInSurah'].toString()}") , style: TextStyle(fontSize: 24), overflow: TextOverflow.clip,textAlign: TextAlign.center, ),
          )

            ],
          ),
        ),
      ),
    );
  }
}
