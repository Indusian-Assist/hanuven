import 'package:flutter/material.dart';
import 'package:hanuven/utils/constants/color.dart';
import 'components/body.dart';
import 'components/components.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Future<dynamic> products() async {
  //   return await BaseClient().get('https://hanuven.vercel.app', '/api/product');
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBackgroundColor,
        appBar: Components.customPreferredSize(context),
        body: const Body());
  }
}
