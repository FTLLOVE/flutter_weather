import 'package:flutter/material.dart';
import 'weather_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Weather',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WeatherWidget(),
    );
  }
}
