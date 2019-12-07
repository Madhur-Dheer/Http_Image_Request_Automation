import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'models/image_model.dart';
import 'widgets/image_list.dart';
import 'dart:convert';
//Create a class that will be our custom widget
// this class must extend the 'StatelessWidget' base class

//Refactoring to a StatefulWidget
//Step 1: Break the Widget into two separate classes the Widget and the Widget's State
//Step 2: Add a 'createState' method to the widget class that returns as instance of Widget State
//Step 3: Add build method to the Widget State class
//Step 4: Add instance variables to the Widget State class
//Step 5: Any time the Widget State class's data changes ,call the 'setState' method

class App extends StatefulWidget{

  createState()
  {
    return AppState();
  }


}

class AppState extends State<App>{


  int counter=1;
  List<ImageModel> images=[];
///Make an Http request
  void fetchImage() async{
   final jsonmodel=await get('http://jsonplaceholder.typicode.com/photos/$counter');
   final imageModel=ImageModel.fromJson(json.decode(jsonmodel.body));

   setState(() {
     images.add(imageModel);
   });

   counter+=1;

  }


//Must define a build method that
// returns the widgets that this widget will show
Widget build(context) {
  return MaterialApp(
    home: Scaffold(
      body: ImageList(images),
      appBar: AppBar(
        title: Text('Lets See Some Images'),
      ),
      floatingActionButton:FloatingActionButton(
        child: Icon(
            Icons.clear
        ),
        onPressed:fetchImage, //onPressed is an @required function where void callback functions needs to be input as a parameter
      ) ,

    ),
  );

}

}

