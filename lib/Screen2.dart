import 'package:flutter/material.dart';
import 'main.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('2 экран',style:TextStyle( color: Colors.blue[900]),),
        backgroundColor: Colors.blue[300],
      ),
      body: Center(
        child: Column(
            children: [
              ElevatedButton(
                style: raisedButtonStyle,
                onPressed: () {
                  Navigator.pushNamed(context, '/screen1');
                },
                child: Text('1 экран',style:TextStyle( color: Colors.blue[900]),),
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
              ), ]
        ),
      ),
    );
  }
}
