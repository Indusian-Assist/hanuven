import 'package:flutter/material.dart';

import '../Home/components/components.dart';
import 'components/body.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: Components.customPreferredSize(),
      body: Body(),
    );
  }
}
