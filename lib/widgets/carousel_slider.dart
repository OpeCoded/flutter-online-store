import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

Widget carouselSlider(items) {
  //var autoPlay = false;
  // if (items.length > 0) {
  //   autoPlay = true;
  // }
  return SizedBox(
    height: 280,
    child: Carousel(
      boxFit: BoxFit.cover,
      images: items,
      autoplay: true,
      animationCurve: Curves.fastOutSlowIn,
      animationDuration: Duration(milliseconds: 1000),
    ),
  );
}
