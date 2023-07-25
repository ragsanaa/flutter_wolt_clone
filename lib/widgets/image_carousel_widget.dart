// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_seven/classes/carousel_image.dart';
import 'package:google_fonts/google_fonts.dart';

final List<CarouselImage> imgList = [
  CarouselImage(
      imgPath: 'assets/images/freshbox.avif',
      heading: 'FreshBox',
      category: 'Grocery',
      label: 'Up to 50% discount on selected items',
      discount: 50),
  CarouselImage(
      imgPath: 'assets/images/hamburger.webp',
      heading: 'KFC',
      label: '20% discount on new combo menus'),
  CarouselImage(
      imgPath: 'assets/images/delivery.avif', label: 'on orders up to 5 km'),
  CarouselImage(
      imgPath: 'assets/images/giftcard.avif',
      heading: 'Wolt Gift Cards',
      category: 'Gift Cards'),
  CarouselImage(imgPath: 'assets/images/papajohns.png'),
  CarouselImage(
      imgPath: 'assets/images/lahmacun.webp',
      heading: 'Central Baku',
      category: 'Restaurant',
      label: '30% discount on the whole menus'),
  CarouselImage(imgPath: 'assets/images/discount.avif', discount: 10),
];

final List<Widget> imageSliders = imgList
    .map((item) => Container(
          margin: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
          child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              child: Stack(
                children: [
                  Image.asset(
                    item.imgPath,
                    fit: BoxFit.cover,
                    width: 1000.0,
                  ),
                  if (item.heading != '' ||
                      item.category != '' ||
                      item.label != '')
                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        height: 200,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(200, 0, 0, 0),
                              Color.fromARGB(0, 0, 0, 0)
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            if (item.category != '')
                              Text(
                                item.category.toUpperCase(),
                                style: TextStyle(
                                  color: Colors.grey[300],
                                  fontSize: 14.0,
                                ),
                              ),
                            if (item.heading != '')
                              Text(
                                item.heading,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            if (item.label != '')
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text(
                                  item.label,
                                  style: TextStyle(
                                    color: Colors.grey[50],
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  if (item.discount != 0) discountLabel(item.discount),
                ],
              )),
        ))
    .toList();

class ImageCarousel extends StatefulWidget {
  const ImageCarousel({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ImageCarouselState();
  }
}

class _ImageCarouselState extends State<ImageCarousel> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CarouselSlider(
        items: imageSliders,
        carouselController: _controller,
        options: CarouselOptions(
            autoPlay: true,
            aspectRatio: 2.0,
            viewportFraction: 1.0,
            height: 250,
            autoPlayInterval: Duration(seconds: 6),
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            }),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: imgList.asMap().entries.map((entry) {
          return GestureDetector(
            onTap: () => _controller.animateToPage(entry.key),
            child: Container(
              width: 4.0,
              height: 4.0,
              margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 2.0),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: (Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black)
                      .withOpacity(_current == entry.key ? 0.5 : 0.1)),
            ),
          );
        }).toList(),
      ),
    ]);
  }
}

Align discountLabel(int discount) {
  return Align(
    widthFactor: 5.7,
    alignment: Alignment.topRight,
    child: Container(
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(10),
          bottomLeft: Radius.circular(10),
        ),
      ),
      width: 65,
      height: 45,
      child: Center(
        child: Text(
          '-$discount%',
          style: GoogleFonts.openSans(
              color: Colors.white, fontWeight: FontWeight.w600, fontSize: 20),
        ),
      ),
    ),
  );
}
