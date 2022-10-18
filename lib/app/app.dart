import 'package:flutter/material.dart';

class App extends StatefulWidget{
  const App._interval(); // private named constructor
  static const  App instance = App._interval(); // instance
  factory App()=>instance; // factory


  @override
  State<App> createState()=> _AppState();
}

class _AppState extends State<App>{
  @override
  Widget build(BuildContext context){
    return Scaffold();
  }
}