import 'package:flutter/material.dart';
import 'main.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('1 экран',style:TextStyle( color: Colors.blue[900]),),
        backgroundColor: Colors.blue[300],
      ),
      body: Center(
        child: Column(
            children:<Widget> [
              ElevatedButton(
                style: raisedButtonStyle,
                onPressed: () {
                  Navigator.pushNamed(context, '/screen2');
                },
                child: Text('2 экран',style:TextStyle( color: Colors.blue[900]),),
              ),
              ElevatedButton(
                style: raisedButtonStyle,
                onPressed: () {
                  Navigator.pushNamed(context, '/screen3');
                },
                child: Text('3 экран',style:TextStyle( color: Colors.blue[900]),),
              ),
              ElevatedButton(
                style: raisedButtonStyle,
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Назад',style:TextStyle( color: Colors.blue[900]),),
              ),
              ElevatedButton(
                style: raisedButtonStyle,
                onPressed: () {
                  Navigator.pushNamed(context, '/');
                },
                child: Text('Домашняя страница',style:TextStyle( color: Colors.blue[900]),),
              ),
              Container(
                height: 400,
                width: 300,
                child:FittedBox(
                  fit: BoxFit.cover,
                  child: CachedNetworkImage(
                    imageUrl: "https://sun9-67.userapi.com/impf/2qvUBKW771bdZ2D52WuJeyf1Oh6PEV_YZhd0FQ/kA8WQaB1Xr8.jpg?size=1280x1053&quality=96&sign=fda063a8ccdb29d369bac53d31de4373&c_uniq_tag=Y4Aar_5edMzwlPTfkXDlhTXfRK4k3QklL6ehEywbepM&type=album",
                    progressIndicatorBuilder: (context, url, progress) =>
                    const CircularProgressIndicator(),
                    errorWidget:(context, url, progress) => const Center(
                      child: Icon(Icons.error, color: Colors.red,),
                    ),
                  ),
                ),
              ),
            ]
        ),
      ),
    );
  }
}

