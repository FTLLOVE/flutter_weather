import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'city_list_widget.dart';

class CityWidget extends StatefulWidget {
  @override
  _CityWidgetState createState() => _CityWidgetState();
}

class _CityWidgetState extends State<CityWidget> {
  final TextEditingController _editingController = new TextEditingController();

  String tip = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "添加城市",
          style: TextStyle(fontSize: 18.0),
        ),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => CityListWidget()));
              })
        ],
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            TextField(
              autofocus: false,
              controller: _editingController,
              decoration: InputDecoration(labelText: "城市名"),
            ),
            SizedBox(
              height: 5.0,
            ),
            RaisedButton(
              textTheme: ButtonTextTheme.primary,
              onPressed: () {
                checkCityAvailable();
              },
              child: Text(
                "保存",
                style: TextStyle(color: Color(0xffffffff)),
              ),
              color: Colors.lightBlue,
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              alignment: Alignment.center,
              child: Text(tip),
            )
          ],
        ),
      ),
    );
  }

  void checkCityAvailable() {
    getHttpCityAvailable(_editingController.text.toString()).then((data) {
      var result = data['result'];
      if (result == "" || result == null) {
        print(data['reason']);
        setState(() {
          tip = data['reason'];
        });
      } else {
        tip = "保存成功";
      }
    });
  }

  Future getHttpCityAvailable(String inputText) async {
    try {
      Response response;
      var data = {"city": inputText, "key": 'c10f06876b3af332123ec085d8b70e09'};
      response = await Dio().get('https://apis.juhe.cn/simpleWeather/query',
          queryParameters: data);
      return response.data;
    } catch (e) {
      return print(e);
    }
  }
}
