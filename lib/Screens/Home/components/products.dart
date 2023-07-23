import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';
import '../../../api/models/products.dart';
import '../../../utils/constants/color.dart';
import '../../Product/product.dart';
import 'components.dart';

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
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SkeletonTheme(
      // themeMode: ThemeMode.light,
      shimmerGradient: const LinearGradient(
        colors: [
          Color.fromARGB(255, 81, 134, 225),
          Color.fromARGB(255, 129, 170, 251),
          Color.fromARGB(255, 142, 171, 238),
        ],
        stops: [
          0.1,
          0.5,
          0.9,
        ],
      ),
      darkShimmerGradient: const LinearGradient(
        colors: [
          Color(0xFF222222),
          Color(0xFF242424),
          Color(0xFF2B2B2B),
          Color(0xFF242424),
          Color(0xFF222222),
        ],
        stops: [
          0.0,
          0.2,
          0.5,
          0.8,
          1,
        ],
        begin: Alignment(-2.4, -0.2),
        end: Alignment(2.4, 0.2),
        tileMode: TileMode.clamp,
      ),
      child: FutureBuilder<dynamic>(
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
                    closedShape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(30.0),
                      ),
                    ),
                    transitionType: widget._containerTransitionType,
                    transitionDuration: const Duration(milliseconds: 500),
                    closedBuilder: (context, _) => Components.customProductCard(
                        // kProduct1Url,
                        products.data[0].photo,
                        products.data[0].name,
                        'INR ${products.data[0].price}', size),
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
                    closedShape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(30.0),
                      ),
                    ),
                    transitionType: widget._containerTransitionType,
                    transitionDuration: const Duration(milliseconds: 500),
                    closedBuilder: (context, _) => Components.customProductCard(
                        products.data[1].photo,
                        products.data[1].name,
                        'INR ${products.data[1].price}', size),
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
          return Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 30.0, horizontal: 20.0),
                  child: SkeletonAvatar(
                    style: SkeletonAvatarStyle(
                      width: size.width * 0.38,
                      height: size.height * 0.28,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 30.0, horizontal: 20.0),
                  child: SkeletonAvatar(
                    style: SkeletonAvatarStyle(
                      width: size.width * 0.38,
                      height: size.height * 0.28,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
