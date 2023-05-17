import 'package:flutter/material.dart';
import 'components/body.dart';

class ProductScreen extends StatelessWidget {
  final String pimage;
  final String title;
  final String desc;
  final String price;
  const ProductScreen(
      {super.key,
      required this.price,
      required this.pimage,
      required this.title,
      required this.desc});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: Components.customPreferredSize(),
      body: Body(pimage: pimage, title: title, desc: desc, price: price),
    );
  }
}
