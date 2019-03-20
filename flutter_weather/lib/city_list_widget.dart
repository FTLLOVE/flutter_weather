import 'package:flutter/material.dart';

class CityListWidget extends StatefulWidget {
  @override
  _CityListWidgetState createState() => _CityListWidgetState();
}

class _CityListWidgetState extends State<CityListWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("已选中城市列表",style: TextStyle(fontSize: 18.0),),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Container(
        child: ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemBuilder: (context, index) {
            if (index.isOdd) return Divider();
            return Text("蚌埠",
                style: TextStyle(color: Colors.lightBlue, fontSize: 18.0));
          },
          itemCount: 50,
        ),
      ),
    );
  }
}
