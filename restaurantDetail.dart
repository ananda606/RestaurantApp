import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:submission/jsonparse.dart';
import 'dart:convert';

class RestaurantDetail extends StatelessWidget {
  static const routeName = '/Restaurant_Detail';
  final Restaurant restaurant;
  const RestaurantDetail({required this.restaurant});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              height: 600,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                      padding: EdgeInsets.only(top: 40),
                      child: Container(
                        child: Image.network(restaurant.pictureId),
                        height: 200,
                        width: double.infinity,
                        decoration: BoxDecoration(),
                      )),
                  Padding(
                      padding: EdgeInsets.only(top: 10, left: 10),
                      child: Container(
                        child: Text(
                          restaurant.name,
                          style: TextStyle(
                            fontFamily: 'Oxygen',
                            fontStyle: FontStyle.normal,
                            fontSize: 20,
                          ),
                        ),
                      )),
                  Padding(
                      padding: EdgeInsets.only(top: 10, left: 10),
                      child: Container(
                        child: Text(
                          restaurant.city,
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontFamily: 'Oxygen',
                            fontSize: 10,
                          ),
                        ),
                      )),
                  Padding(
                      padding: EdgeInsets.only(top: 10, left: 10),
                      child: Container(
                        child: Text(
                          restaurant.description,
                          style: TextStyle(
                            fontFamily: 'Oxygen',
                            fontSize: 10,
                          ),
                        ),
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Card(
                      child: InkWell(
                        splashColor: Colors.grey,
                        onTap: () {
                          debugPrint('card tapped');
                        },
                        child: SizedBox(
                          width: 100,
                          height: 100,
                          child: Column(
                              children: [Text('${restaurant.menus.drinks}')]),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )));
  }
}

/*FutureBuilder<String>(
                    future: DefaultAssetBundle.of(context)
                        .loadString('jsonfile/local_restaurant.json'),
                    builder: (context, snapshot) {
                      var json = jsonDecode(snapshot.data!);
                      var restaurant = LocalRestaurant.fromJson(json);
                      return PageView.builder(
                        itemCount: restaurant.restaurants.length,
                        itemBuilder: (context, index) {
                          return Container(
                              alignment: Alignment.bottomCenter,
                              child: DetailPage(
                                  context, restaurant.restaurants[index]));
/*                        },*/
Widget DetailPage(BuildContext context, Restaurant restaurant) {
  return 
}*/
