import 'package:flutter/material.dart';
import 'package:submission/restaurantDetail.dart';
import 'package:submission/jsonparse.dart';
import 'dart:convert';
import 'package:anim_search_bar/anim_search_bar.dart';

class restaurantList extends StatelessWidget {
  static const routeName = '/Restaurant_list';

  const restaurantList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
              child: Column(children: [
        Container(
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                    padding: EdgeInsets.only(top: 10, left: 20),
                    child: Column(children: [
                      Align(
                        alignment: Alignment.center,
                      ),
                      Text(
                        'Restaurant List',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: 'Oxygen'),
                      ),
                      Text(
                        'Recommended Restaurant',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontFamily: 'Oxygen'),
                      )
                    ])),
                Padding(
                    padding: EdgeInsets.only(left: 40, top: 10),
                    child: IconButton(
                        splashColor: Colors.black,
                        splashRadius: 20,
                        onPressed: () {},
                        icon: Icon(
                          Icons.search,
                          color: Colors.white,
                        ))),
              ]),
          height: 80,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15))),
        ),
        SizedBox(
          height: 30,
        ),
        Container(
            height: 600,
            decoration: BoxDecoration(color: Colors.white),
            child: FutureBuilder<String>(
                future: DefaultAssetBundle.of(context)
                    .loadString('jsonfile/local_restaurant.json'),
                builder: (context, snapshot) {
                  final Map<String, dynamic> json = jsonDecode(snapshot.data!);

                  final restaurant = Welcome.fromJson(json);
                  if (snapshot.hasData != null) {
                    return ListView.builder(
                        itemCount: restaurant.restaurants.length,
                        itemBuilder: (context, index) {
                          return _buildRestaurantList(
                              context, restaurant.restaurants[index]);
                        });
                  } else {
                    throw CircularProgressIndicator();
                  }
                }))
      ]))),
    );
  }
}

Widget _buildRestaurantList(BuildContext context, Restaurant restaurant) {
  return Container(
      alignment: Alignment.bottomCenter,
      child: Card(
          shadowColor: Colors.grey,
          borderOnForeground: true,
          child: ListTile(
            selectedColor: Colors.white,
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            leading: Image.network(
              restaurant.pictureId,
              width: 100,
              height: 100,
              fit: BoxFit.contain,
            ),
            title: Text(
              restaurant.name,
            ),
            subtitle: Text('${restaurant.city}\n${restaurant.rating}'),
            trailing: Icon(Icons.more_vert),
            onTap: () {
              Navigator.pushNamed(context, RestaurantDetail.routeName);
            },
          )));
}

//searchbox
class SearchBox extends StatefulWidget {
  SearchBox({Key? key, required this.name}) : super(key: key);
  final String name;
  @override
  _SearchBoxState createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  TextEditingController textEditController = TextEditingController();

  final duplicateItems = List<String>.generate(10000, (i) => "Item $i");
  var items = <String>[];

  @override
  void initState() {
    items.addAll(duplicateItems);
    super.initState();
  }

  void filterSearchResults(String query) {
    List<String> dummySearchList = <String>[];
    dummySearchList.addAll(duplicateItems);
    if (query.isNotEmpty) {
      List<String> dummyListData = <String>[];
      dummySearchList.forEach((item) {
        if (item.contains(query)) {
          dummyListData.add(item);
        }
      });
      setState(() {
        items.clear();
        items.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        items.clear();
        items.addAll(duplicateItems);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
//animasi searchbox

//animasi
class transitionAnimation extends StatefulWidget {
  @override
  _transitionAnimationState createState() => _transitionAnimationState();
}

class _transitionAnimationState extends State<transitionAnimation> {
  bool _isbig = false;
  double _size = 100;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedContainer(
            duration: const Duration(seconds: 1),
            color: Colors.blue,
            height: _size,
            width: _size,
          ),
          ElevatedButton(
            child: const Text('Animate'),
            onPressed: () {
              setState(() {
                _size = _isbig ? 200 : 100;
                _isbig = !_isbig;
              });
            },
          ),
        ],
      ),
    ));
  }
}
/*Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.amber),
            child: const Padding(
                padding: EdgeInsets.only(left: 20, top: 20, bottom: 10),
                child: Text(
                  '''Restaurant List\nRecomendation Restaurant  
                ''',
                  style: TextStyle(fontSize: 20, fontFamily: 'Oxygen'),
                )),
          ),
          /*
          Container(
              decoration: BoxDecoration(color: Colors.amber),
              child: const Padding(
                  padding: EdgeInsets.only(left: 20, bottom: 20),
                  child: Text(
                    'Recommendation Restaurant',
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ))),*/
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(children: [
                    Image.asset(
                      'images/study.png',
                      height: 200,
                    ),
                    Column(children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 20, top: 20),
                        child: Text(
                          'Restaurant name',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              decorationStyle: TextDecorationStyle.dashed,
                              color: Colors.white),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(left: 20, top: 20),
                          child: Row(children: [
                            const Icon(Icons.location_on),
                            const Text(
                              'Restaurant Location',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  decorationStyle: TextDecorationStyle.dotted,
                                  color: Colors.black),
                            ),
                          ])),
                      Padding(
                          padding: const EdgeInsets.only(left: 10, top: 10),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.star_border,
                                size: 15,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text(
                                'Ratings',
                              )
                            ],
                          )),
                    ])
                  ])),
            ),
          )
        ],
      ), */