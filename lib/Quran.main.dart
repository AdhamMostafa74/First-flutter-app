import 'dart:io';

import 'package:flutter/material.dart';

import 'SplScreen.dart';

main(){
  HttpOverrides.global = MyHttpOverrides();
  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplScreen(),

      )
  );
}
class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}