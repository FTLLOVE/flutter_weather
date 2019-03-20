import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'city_widget.dart';

class WeatherWidget extends StatefulWidget {
  @override
  _WeatherWidgetState createState() => _WeatherWidgetState();
}

class _WeatherWidgetState extends State<WeatherWidget> {
  String city; // 城市

  String temperature; // 温度

  String info; // 天气状况

  String humidity; // 湿度
  @override
  void initState() {
    _getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset(
            "assets/images/weather_bg.jpg",
            fit: BoxFit.fitHeight,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(top: 20.0),
                alignment: Alignment.centerRight,
                child: IconButton(
                  icon: Icon(
                    Icons.settings,
                    color: Color(0xffffffff),
                    size: 25.0,
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => CityWidget()));
                  },
                ),
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(top: 20.0),
                child: Text(
                  city,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Color(0xffffffff), fontSize: 30.0),
                ),
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(top: 80.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      temperature + "°",
                      style:
                          TextStyle(color: Color(0xffffffff), fontSize: 60.0),
                    ),
                    Text(
                      info,
                      style:
                          TextStyle(color: Color(0xffffffff), fontSize: 25.0),
                    ),
                    Text(
                      "湿度 " + humidity,
                      style:
                          TextStyle(color: Color(0xffffffff), fontSize: 20.0),
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  void _getData() {
    getHttpData().then((data) {
      setState(() {
        city = data['result']['city'];
        temperature = data['result']['realtime']['temperature'];
        info = data['result']['realtime']['info'];
        humidity = data['result']['realtime']['humidity'];
      });
    });
  }

  Future getHttpData() async {
    try {
      Response response;
      var data = {"city": "南京", "key": 'c10f06876b3af332123ec085d8b70e09'};
      response = await Dio().get('https://apis.juhe.cn/simpleWeather/query',
          queryParameters: data);
      return response.data;
    } catch (e) {
      return print(e);
    }
  }
}
