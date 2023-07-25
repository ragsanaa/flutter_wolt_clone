// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class MiniCard extends StatelessWidget {
  final String title;
  final String imagePath;
  final String subTitle;
  const MiniCard({
    super.key,
    required this.title,
    required this.imagePath,
    this.subTitle = '',
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
      width: 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            imagePath,
            height: subTitle == '' ? 115 : 100,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.openSans(
                      fontSize: 12, fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                ),
                if (subTitle != '')
                  Text(
                    subTitle,
                    style:
                        GoogleFonts.openSans(fontSize: 12, color: Colors.grey),
                  )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
