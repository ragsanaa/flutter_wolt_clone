// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:google_fonts/google_fonts.dart';
import 'package:styled_divider/styled_divider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PostCard extends StatelessWidget {
  final String title;
  final String subTitle;
  final double deliveryFee;
  final String time;
  final double smileRate;
  final String imagePath;

  const PostCard({
    super.key,
    required this.title,
    required this.subTitle,
    this.deliveryFee = 0.0,
    required this.time,
    this.smileRate = 0.0,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      margin: EdgeInsets.fromLTRB(0, 0, 10, 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Color(0xffDDDDDD),
              blurRadius: 5.0,
              offset: Offset(0.0, 0.75),
            )
          ]),
      width: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.asset(
                imagePath,
                fit: BoxFit.cover,
                height: 150,
                width: double.infinity,
              ),
              if (deliveryFee == 0) deliveryLabel(),
            ],
          ),
          SizedBox(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.openSans(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(subTitle, style: GoogleFonts.openSans(fontSize: 16)),
                  ],
                ),
              ),
              SizedBox(
                height: 0,
                child: StyledDivider(
                  lineStyle: DividerLineStyle.dashed,
                  color: Colors.grey[400],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    FaIcon(FontAwesomeIcons.personBiking,
                        size: 16, color: Colors.green),
                    Text(' $deliveryFee ₼',
                        style: GoogleFonts.openSans(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.green)),
                    Text(' • '),
                    Text('$time min',
                        style: GoogleFonts.openSans(fontSize: 16)),
                    Text(' • '),
                    FaIcon(
                      FontAwesomeIcons.faceSmile,
                      size: 18,
                    ),
                    Text(' $smileRate',
                        style: GoogleFonts.openSans(fontSize: 16))
                  ],
                ),
              )
            ],
          ))
        ],
      ),
    );
  }

  Align deliveryLabel() {
    return Align(
        heightFactor: 4.0,
        alignment: Alignment.bottomRight,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
              bottomLeft: Radius.circular(50),
            ),
          ),
          width: 150,
          height: 30,
          child: Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              children: [
                Text(
                  'Free delivery',
                  style: GoogleFonts.openSans(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: FaIcon(
                    FontAwesomeIcons.ticket,
                    color: Colors.white,
                    size: 18,
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
