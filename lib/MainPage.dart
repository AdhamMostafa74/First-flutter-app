import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'AboutUs.dart';
import 'TabViewPage.dart';

class MainPage extends StatefulWidget {


  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
   List test =[];

  @override
  void initState() {
    super.initState();
    getDataAPI();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child:
        ListView(
          children: [
            Column(
              children: [
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (c){
                      return AboutUs();
                    } ));
                  },
                  child: const ListTile(
                    title : Text("About us" , style: TextStyle(fontSize: 18 , fontStyle: FontStyle.italic),),
                    trailing: Icon(Icons.group),
                  ),
                ),
                const ListTile(
                  title : Text("Version" , style: TextStyle(fontSize: 18 , fontStyle: FontStyle.italic),),
                  trailing: Text("1.0.0", style: TextStyle(fontSize: 14 , )
                ),
                )
              ],
            )
          ],
        )
        ,

      ),
      appBar: AppBar(
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20 ,top: 10),
            child: Text('القرآن الكريم',style:TextStyle(fontSize: 20) , textAlign: TextAlign.left,),
          ),
        ],
        backgroundColor: Colors.black87,
      ),
      body: Container(
        height: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                for (int i = 0 ; i < test.length ; i++)
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (c){
                        return TabViewPage(test[i]);
                      } ));
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                      ),
                      color: Colors.white70,
                      child: ListTile(
                        title: Text(test[i]['number'].toString() , style: const TextStyle(fontSize: 18 , fontStyle: FontStyle.italic)),
                        trailing: Text(test[i]['name'] , style: const TextStyle(fontSize: 22 , fontWeight: FontWeight.bold ,fontStyle: FontStyle.italic),),
                      ),
                    ),
                  )
                ),


              ],
            ),
          ),
        ),
      ),
    );

  }

  getDataAPI()async{
    http.Response data = await http.get(Uri.parse("http://api.alquran.cloud/v1/quran/ar.alafasy"));
    Map<String, dynamic> body =jsonDecode(data.body);
    if(body.containsKey("data")) {
      test = body["data"]["surahs"];
    }

   setState(() {

   });

  }
}