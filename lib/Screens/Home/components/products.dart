import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import '../../../api/models/products.dart';
import '../../../utils/constants/color.dart';
import '../../Product/product.dart';
import 'components.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ProductsSection extends StatefulWidget {
  const ProductsSection({
    super.key,
    required ContainerTransitionType containerTransitionType,
  }) : _containerTransitionType = containerTransitionType;

  final ContainerTransitionType _containerTransitionType;

  @override
  State<ProductsSection> createState() => _ProductsSectionState();
}

class _ProductsSectionState extends State<ProductsSection> {
  final spinkit = SpinKitFadingCircle(
    color: kButtonColor,
    size: 50.0,
  );
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>(
      future: fetchProducts(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final products = snapshot.data!;
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: OpenContainer(
                  middleColor: Colors.orange,
                  openColor: kTransparentColor,
                  closedShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(30.0),
                    ),
                  ),
                  transitionType: widget._containerTransitionType,
                  transitionDuration: Duration(milliseconds: 500),
                  closedBuilder: (context, _) => Components.customProductCard(
                      // kProduct1Url,
                      products.data[0].photo,
                      products.data[0].name,
                      'INR ${products.data[0].price}'),
                  openBuilder: (context, _) => ProductScreen(
                    pimage: products.data[0].photo,
                    title: products.data[0].name,
                    desc: products.data[1].description,
                    price: '₹ ${products.data[1].price}',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: OpenContainer(
                  middleColor: Colors.orange,
                  openColor: kTransparentColor,
                  closedShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(30.0),
                    ),
                  ),
                  transitionType: widget._containerTransitionType,
                  transitionDuration: Duration(milliseconds: 500),
                  closedBuilder: (context, _) => Components.customProductCard(
                      products.data[1].photo,
                      products.data[1].name,
                      'INR ${products.data[1].price}'),
                  openBuilder: (context, _) => ProductScreen(
                    pimage: products.data[1].photo,
                    title: products.data[1].name,
                    desc: products.data[1].description,
                    price: '₹ ${products.data[1].price}',
                  ),
                ),
              ),
            ],
          );
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }
        return Center(child: spinkit);
      },
    );
  }
}
