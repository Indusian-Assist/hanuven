import 'package:flutter/material.dart';
import 'package:hanuven/api/services/base_client.dart';


class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  // store a response from the server

  Future<dynamic> products() async {
    return await BaseClient().get('https://hanuven.vercel.app', '/api/product');
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: getData(),
      ),
    );
  }

  Widget getData() {
  return FutureBuilder<dynamic>(
    future: products(),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        final products = snapshot.data!;
        return ListView.builder(
          itemCount: products.data.length,
          itemBuilder: (context, index) {
            final datum = products.data[index];
            return ListTile(
              title: Text(datum.name),
              subtitle: Text(datum.description),
              trailing: Text('Price: \$${datum.price.toString()}'),
            );
          },
        );
      } else if (snapshot.hasError) {
        return Text(snapshot.error.toString());
      }
      return CircularProgressIndicator();
    },
  );
}

}
