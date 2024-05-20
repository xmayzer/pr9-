import 'dart:html';

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get_it/get_it.dart';
import 'Screen1.dart';
import 'Screen2.dart';
import 'Screen3.dart';

GetIt getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<Params>(Params(param1: "H", param2: "N"));
}

void main() async{
  fetchDataUsing();
  setupGetIt();
  await fetchDataUsingAsyncAwait();
  runApp(MyApp());
}

class Params {
  final String param1;
  final String param2;

  Params({required this.param1, required this.param2});
}
class ParamsProvider extends InheritedWidget {
  final Params params;

  ParamsProvider({ required this.params, required Widget child}) : super(child: child);

  static ParamsProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ParamsProvider>();
  }

  @override
  bool updateShouldNotify(ParamsProvider oldWidget) {
    return params != oldWidget.params;
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    GetIt getIt = GetIt.instance;
    Params params = Params(param1: 'H', param2: "N");
    return ParamsProvider(
      params: params,
      child: MaterialApp(
        title: 'Приложение',
        initialRoute: '/',
        routes: {
          '/': (context) => HomeScreen(),
          '/screen1': (context) => Screen1(),
          '/screen2': (context) => Screen2(),
          '/screen3': (context) => Screen3(),
        },
      ),
    );
  }
}


final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
  minimumSize: Size(400, 36),
  padding: EdgeInsets.symmetric(horizontal: 16),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(2)),
  ),
);

void fetchDataUsing(){
  Future<String> messageFromFuture = futureMessage0();
  messageFromFuture.then((message){
    print(message);
  });
}
Future <void> fetchDataUsingAsyncAwait() async {
  print('Выборка данных.....');
  await Future.delayed(Duration(seconds: 2));
  print('Данные получены.....');
}

Future<String> futureMessage0() {
  return Future.delayed(Duration(seconds: 2), () => "Загрузка...");
}


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text('Домашняя страница', style: TextStyle( color: Colors.blue[900])),
        backgroundColor: Colors.blue[300],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: raisedButtonStyle,
              child: Text('Маршрутизированная вертикальная навигация',style:TextStyle( color: Colors.blue[900]),),
              onPressed: () {
                Navigator.pushNamed(context, '/screen1');
              },
            ),
            ElevatedButton(
              style: raisedButtonStyle,
              child: Text('Страничная горизонтальная навигация',style:TextStyle( color: Colors.blue[900]),),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => HorizontalScreen1()));
              },
            ),
            Container(
              height: 400,
              width: 300,
              child: FittedBox(
                fit: BoxFit.cover,
                child: CachedNetworkImage(
                  imageUrl: "https://blog.imon.net/hs-fs/hubfs/Imported_Blog_Media/adobestock_99671931-2.jpeg?width=435&height=306&name=adobestock_99671931-2.jpeg",
                  progressIndicatorBuilder: (context, url, progress) =>
                  const CircularProgressIndicator(),
                  errorWidget:(context, url, progress) => const Center(
                    child: Icon(Icons.error, color: Colors.red,),
                  ),
                ),
              ),
            ),
            ElevatedButton(
              style: raisedButtonStyle,
              onPressed: () {
                Params params = getIt.get<Params>();
                print('Параметры GetIt: ${params.param1} ${params.param2}');
              },
              child: Text('Получить параметры'),
            ),
          ],
        ),
      ),
    );
  }
}


class HorizontalScreen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('1 экран',style:TextStyle( color: Colors.blue[900])),
        backgroundColor: Colors.blue[300],
      ),
      body: Center(

        child: Column(
            children: <Widget>[
              ElevatedButton(
                style: raisedButtonStyle,
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HorizontalScreen2()));
                },
                child: Text('2 экран',style:TextStyle( color: Colors.blue[900]),),
              ),
              ElevatedButton(
                style: raisedButtonStyle,
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HorizontalScreen3()));
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
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                },
                child: Text('Домашняя страница',style:TextStyle( color: Colors.blue[900]),),
              ),
              Container(
                height: 400,
                width: 300,
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: CachedNetworkImage(
                    imageUrl: "https://fmiguild.org/wp-content/uploads/2014/11/1428672_39179615-1024x1024.jpg",
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

class HorizontalScreen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('2 экран',style:TextStyle( color: Colors.blue[900])),
        backgroundColor: Colors.blue[300],
      ),
      body: Center(
        child: Column(
            children: <Widget>[
              ElevatedButton(
                style: raisedButtonStyle,
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HorizontalScreen1()));
                },
                child: Text('1 экран',style:TextStyle( color: Colors.blue[900]),),
              ),
              ElevatedButton(
                style: raisedButtonStyle,
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HorizontalScreen3()));
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
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                },
                child: Text('Домашняя страница',style:TextStyle( color: Colors.blue[900]),),
              ),
              Container(
                height: 400,
                width: 300,
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: CachedNetworkImage(
                    imageUrl: "https://sc01.alicdn.com/kf/HTB1IkXomcLJ8KJjy0Fnq6AFDpXaX/202311158/HTB1IkXomcLJ8KJjy0Fnq6AFDpXaX.jpg",
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

class HorizontalScreen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('3 экран',style:TextStyle( color: Colors.blue[900])),
        backgroundColor: Colors.blue[300],
      ),
      body: Center(
        child: Column(
            children: <Widget>[
              ElevatedButton(
                style: raisedButtonStyle,
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HorizontalScreen1()));
                },
                child: Text('1 экран',style:TextStyle( color: Colors.blue[900]),),
              ),
              ElevatedButton(
                style: raisedButtonStyle,
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HorizontalScreen2()));
                },
                child: Text('2 экран',style:TextStyle( color: Colors.blue[900]),),
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
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                },
                child: Text('Домашняя страница',style:TextStyle( color: Colors.blue[900]),),
              ),
              Container(
                height: 400,
                width: 300,
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: CachedNetworkImage(
                    imageUrl: "https://ir.ozone.ru/s3/multimedia-n/6584649611.jpg",
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
