// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:resortbooking/User/Common/Constant.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Photos extends StatefulWidget {
  const Photos({Key? key}) : super(key: key);

  @override
  State<Photos> createState() => _PhotosState();
}

class _PhotosState extends State<Photos> {
  final List HotelImg = [
    'assets/image/bath.jpg',
    'assets/image/dinner.jpg',
    'assets/image/hall.jpg',
    'assets/image/pool.jpg',
    'assets/image/room.jpg',
    'assets/image/bath.jpg',
    'assets/image/dinner.jpg',
    'assets/image/hall.jpg',
    'assets/image/pool.jpg',
    'assets/image/room.jpg',
    'assets/image/bath.jpg',
    'assets/image/dinner.jpg',
    'assets/image/hall.jpg',
    'assets/image/pool.jpg',
    'assets/image/room.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.transparent,
          elevation: 0.0),
      body: Container(
        margin: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Photos",
                style:
                    TextStyle(fontSize: 18, fontFamily: 'NotoSans-ExtraBold')),
            heightSpace(10),
            Container(
              height: MediaQuery.of(context).size.height * 0.8,
              child: GridView.builder(
                gridDelegate: SliverQuiltedGridDelegate(
                  crossAxisCount: 4,
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 4,
                  repeatPattern: QuiltedGridRepeatPattern.inverted,
                  pattern: [
                    QuiltedGridTile(2, 2),
                    QuiltedGridTile(1, 1),
                    QuiltedGridTile(1, 1),
                    QuiltedGridTile(1, 2),
                  ],
                ),
                itemCount: HotelImg.length,
                itemBuilder: (context, index) {
                  return Container(
                    child: Image.asset(HotelImg[index]),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
