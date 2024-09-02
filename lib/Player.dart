import 'dart:convert';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

class Player extends StatefulWidget {
  Map sura = {
    'name' : "سُورَةُ ٱلْفَاتِحَةِ",
    'number' : 0,
    'ayahs' : [{
      'number' :0,
      'audio' : '',
      'text' : '',
      'numberInSurah' : 1

    }],
  };
  late List ayatLength = sura["ayahs"];
  late int ayat =sura["ayahs"][0]["numberInSurah"];
  late String ayatAudio = sura["ayahs"][0]["audio"];
  Player(this.sura);
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Player> {
  bool playing= false;
  late IconData playBtn = Icons.play_arrow;
  AudioPlayer _player= AudioPlayer();
  AudioCache  cache =  AudioCache();
  List test =[];
  Map test2 ={};
  @override
  void initState() {
    super.initState();
    getDataAPI();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/test.jpg'),
                fit: BoxFit.cover),
          ),
          child: Column(

            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 420,
                  height: 85,
                  decoration: BoxDecoration(
                      color: Colors.black12.withOpacity(0.4)  ,
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child:
                  Text(widget.sura['name'] ,textAlign: TextAlign.center,  style: TextStyle(fontSize: 55 ,color: Colors.black ,fontWeight: FontWeight.bold),  ),

                ),

              ),
               SizedBox(height: 210,),

               Padding(
                 padding: const EdgeInsets.all(50.0),
                 child: Container(
                  width: 120,
                  height: 85,
                  decoration: BoxDecoration(
                      color: Colors.black12.withOpacity(0.8)  ,
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [

                          IconButton(
                              onPressed: (){
                                if(!playing) {
                                 _player.play(AssetSource("${widget.sura['number']}.mp3"));
                                  setState(() {
                                    playBtn = Icons.pause;
                                    playing= true;
                                  });
                                }else if(playing){
                                  _player.pause();
                                  setState(() {
                                    playBtn = Icons.play_arrow;
                                    playing=false;
                                  });
                                }
                              },
                              iconSize: 60,
                              color: Colors.white70,
                              icon: Icon(playBtn)),

                        ],
                      )
                    ],
                  ),
              ),
               ),
            ],
          ),
        ),

      ),
    );
  }
  getDataAPI()async{
    http.Response data = await http.get(Uri.parse("http://api.alquran.cloud/v1/quran/ar.alafasy"));
    Map<String, dynamic> body =jsonDecode(data.body);

    if(body.containsKey("data"))
      test = body["data"]["surahs"];
    setState(() {

    });

  }
}