import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:submission/restaurantDetail.dart';
import 'package:submission/restaurantList.dart';
import 'package:submission/jsonparse.dart';

void main() => runApp(restaurantApp());

class restaurantApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurant',
      theme: ThemeData(visualDensity: VisualDensity.adaptivePlatformDensity),
      home: restaurantList(),
      debugShowCheckedModeBanner: false,
      initialRoute: restaurantList.routeName,
      routes: {
        restaurantList.routeName: ((context) => restaurantList()),
        RestaurantDetail.routeName: ((context) => RestaurantDetail(
              restaurant:
                  ModalRoute.of(context)?.settings.arguments as Restaurant,
            ))
      },
    );
  }
}
