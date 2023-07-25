// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_seven/classes/card_post.dart';
import 'package:flutter_seven/classes/post.dart';
import 'package:flutter_seven/widgets/image_carousel_widget.dart';
import 'package:flutter_seven/widgets/mini_card_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import 'widgets/post_card_widget.dart';

void main() => runApp(const MyApp());

List<Post> proudctList = [
  Post(
    title: 'Shaurma No1 Caspian Plaza',
    subTitle: 'pizza, salad',
    time: '20-30',
    smileRate: 8.8,
    imagePath: 'assets/images/hamburger.webp',
  ),
  Post(
    title: 'Botanic Cafe',
    subTitle: 'soup, salad',
    deliveryFee: 3.0,
    time: '10-20',
    smileRate: 5.6,
    imagePath: 'assets/images/soup.jpeg',
  ),
  Post(
    title: 'Fuzzy Cafe Caspian Plaza',
    subTitle: 'sweet, cake',
    deliveryFee: 0.0,
    time: '20-30',
    smileRate: 8.0,
    imagePath: 'assets/images/pankek.jpeg',
  ),
  Post(
    title: 'Pizza Mizza Cafar Cabbarli',
    subTitle: 'pizza, tost',
    deliveryFee: 1.0,
    time: '30-40',
    smileRate: 7.8,
    imagePath: 'assets/images/tost.webp',
  ),
  Post(
    title: 'Shaurma No1 Caspian Plaza',
    subTitle: 'shaurma, pizza',
    deliveryFee: 0.0,
    time: '20-30',
    smileRate: 8.8,
    imagePath: 'assets/images/lahmacun.webp',
  ),
  Post(
    title: 'Ejdarha Doner',
    subTitle: 'pizza, hotdog',
    deliveryFee: 3.0,
    time: '10-20',
    smileRate: 7.3,
    imagePath: 'assets/images/hotdog.webp',
  ),
];
List<CardPost> cardList = [
  CardPost(
    title: 'McDonald\'s',
    imagePath: 'assets/images/mcdonalds.png',
  ),
  CardPost(
    title: 'KFC',
    imagePath: 'assets/images/kfc.png',
  ),
  CardPost(
    title: 'Shaurma No1',
    imagePath: 'assets/images/shaurma1.jpeg',
  ),
  CardPost(
    title: 'Papa Johns',
    imagePath: 'assets/images/papajohns.png',
  ),
  CardPost(
    title: 'Bir Iki Doner',
    imagePath: 'assets/images/biriki.jpeg',
  ),
  CardPost(
    title: 'FryDay',
    imagePath: 'assets/images/fryday.jpeg',
  ),
];

List<CardPost> categories = [
  CardPost(
    title: 'American',
    imagePath: 'assets/images/hotdog.webp',
    subTitle: '117 places',
  ),
  CardPost(
    title: 'Salad',
    imagePath: 'assets/images/freshbox.avif',
    subTitle: '433 places',
  ),
  CardPost(
    title: 'Dessert',
    imagePath: 'assets/images/pankek.jpeg',
    subTitle: '156 places',
  ),
  CardPost(
    title: 'Burger',
    imagePath: 'assets/images/hamburger.webp',
    subTitle: '187 places',
  ),
  CardPost(
    title: 'Lahmacun',
    imagePath: 'assets/images/lahmacun.webp',
    subTitle: '123 places',
  ),
  CardPost(
    title: 'Soup',
    imagePath: 'assets/images/soup.jpeg',
    subTitle: '68 places',
  ),
];

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.fromLTRB(10, 5, 0, 5),
            child: Container(
                decoration: BoxDecoration(
                    color: Color(0xFFE3F2FD),
                    borderRadius: BorderRadius.all(Radius.circular(50.0))),
                width: 40,
                height: 40,
                child: Center(
                    child: FaIcon(
                  FontAwesomeIcons.locationCrosshairs,
                  color: Colors.blue,
                ))),
          ),
          title: Row(
            children: [
              Text(
                'Your current location',
                style: GoogleFonts.openSans(
                    color: Colors.blue,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FaIcon(
                  FontAwesomeIcons.chevronDown,
                  color: Colors.blue,
                  size: 12,
                ),
              )
            ],
          ),
        ),
        body: ListView(children: [
          ImageCarousel(),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Fastest delivery',
                      style: GoogleFonts.openSans(
                          fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all(Size(50, 30)),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.blue[50]),
                          foregroundColor:
                              MaterialStateProperty.all(Colors.blue),
                          shape: MaterialStateProperty.resolveWith((states) =>
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          textStyle: MaterialStateProperty.all(TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold))),
                      child: Text('See all'),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
                child: SizedBox(
                  height: 275,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 6,
                    itemBuilder: (BuildContext context, int index) {
                      return PostCard(
                        title: proudctList[index].title,
                        subTitle: proudctList[index].subTitle,
                        deliveryFee: proudctList[index].deliveryFee,
                        time: proudctList[index].time,
                        smileRate: proudctList[index].smileRate,
                        imagePath: proudctList[index].imagePath,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Popular restaurants',
                      style: GoogleFonts.openSans(
                          fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all(Size(50, 30)),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.blue[50]),
                          foregroundColor:
                              MaterialStateProperty.all(Colors.blue),
                          shape: MaterialStateProperty.resolveWith((states) =>
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          textStyle: MaterialStateProperty.all(TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold))),
                      child: Text('See all'),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
                child: SizedBox(
                  height: 160,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 6,
                    itemBuilder: (BuildContext context, int index) {
                      return MiniCard(
                        title: cardList[index].title,
                        imagePath: cardList[index].imagePath,
                        subTitle: cardList[index].subTitle,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Late lunch near you',
                      style: GoogleFonts.openSans(
                          fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all(Size(50, 30)),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.blue[50]),
                          foregroundColor:
                              MaterialStateProperty.all(Colors.blue),
                          shape: MaterialStateProperty.resolveWith((states) =>
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          textStyle: MaterialStateProperty.all(TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold))),
                      child: Text('See all'),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
                child: SizedBox(
                  height: 275,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 6,
                    itemBuilder: (BuildContext context, int index) {
                      return PostCard(
                        title: proudctList[index].title,
                        subTitle: proudctList[index].subTitle,
                        deliveryFee: proudctList[index].deliveryFee,
                        time: proudctList[index].time,
                        smileRate: proudctList[index].smileRate,
                        imagePath: proudctList[index].imagePath,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Categories',
                      style: GoogleFonts.openSans(
                          fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all(Size(50, 30)),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.blue[50]),
                          foregroundColor:
                              MaterialStateProperty.all(Colors.blue),
                          shape: MaterialStateProperty.resolveWith((states) =>
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          textStyle: MaterialStateProperty.all(TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold))),
                      child: Text('See all'),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
                child: SizedBox(
                  height: 160,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 6,
                    itemBuilder: (BuildContext context, int index) {
                      return MiniCard(
                        title: categories[index].title,
                        imagePath: categories[index].imagePath,
                        subTitle: categories[index].subTitle,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Quick links',
                  style: GoogleFonts.openSans(
                      fontSize: 25, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Send a gift',
                        style: GoogleFonts.openSans(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                      FaIcon(
                        FontAwesomeIcons.chevronRight,
                        size: 18,
                      )
                    ],
                  ),
                ),
                Divider(
                  color: Colors.grey[300],
                )
              ],
            ),
          )
        ]),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.city), label: 'Discovery'),
            BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.utensils), label: 'Restaurants'),
            BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.store), label: 'Stores'),
            BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.magnifyingGlass),
                label: 'Search'),
            BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.solidCircleUser),
                label: 'Profile')
          ],
          fixedColor: Colors.blue,
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }
}
