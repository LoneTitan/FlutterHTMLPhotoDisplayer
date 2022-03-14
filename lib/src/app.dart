import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'models/image_model.dart';
import 'dart:convert';
import 'widgets/image_list.dart';

class App extends StatefulWidget{
	@override
  State<StatefulWidget> createState() {
	  return AppState();
  }
}

//StatelessWidget does not maintain its own data
class AppState extends State<App>{

	int counter = 0;

  List<ImageModel> images = [];



  void fetchImage() async {
    counter += 1;
    var response = await get(Uri.parse('https://jsonplaceholder.typicode.com/photos/$counter'));
    var image_model = ImageModel.fromJson(json.decode(response.body));

    setState(() {
      images.add(image_model);
    });

  }

	Widget build(context) {
		return MaterialApp(
			home : Scaffold(
				body : ImageList(images),
				appBar : AppBar(
					
					title : Text("Lets see some images"),
					backgroundColor : Color(0xFF151026),
				),
				floatingActionButton : FloatingActionButton(
					child : Icon(Icons.favorite),
					onPressed: fetchImage, //Notice no paranthesis


				),

			),
		);

	}
  

}

