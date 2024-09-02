import 'package:flutter/material.dart';
class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Colors.blue.shade200, Colors.blue.shade800])
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 100 , horizontal: 0),
          child: Column(
            children: [
              ListTile(
                title : Padding(
                  padding: const EdgeInsets.symmetric(vertical: 1 , horizontal: 1),
                  child: Text("Adham Mostafa : Team leader" , style: TextStyle(fontSize: 40 , fontStyle: FontStyle.italic ,color: Colors.white),
                  ),

                ),
              ),
              ListTile(
                title :Text("Shehab Emad  ", style: TextStyle(fontSize: 40 , fontStyle: FontStyle.italic ,color: Colors.white),
                  ),

                ),
              ListTile(
                title :Text("Abdelrahman Ahmed " , style: TextStyle(fontSize: 40 , fontStyle: FontStyle.italic ,color: Colors.white),
                ),

              ),
              ListTile(
                title :Text("Saleh Mamdouh  ", style: TextStyle(fontSize: 40 , fontStyle: FontStyle.italic ,color: Colors.white),
                ),
              )


            ],
          ),
        ),
      ),
    );
    
  }
}
