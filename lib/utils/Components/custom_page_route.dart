import 'package:flutter/material.dart';

class CustomPageRoute extends PageRouteBuilder {
  final Widget child;
  final AxisDirection direction;

  CustomPageRoute({
    required this.child,
    this.direction = AxisDirection.right,
    RouteSettings? settings,
  }) : super(
          transitionDuration: const Duration(milliseconds: 500),
          // reverseTransitionDuration: const Duration(seconds: 1),
          pageBuilder: (context, animation, secondaryAnimation) => child,
          settings: settings,
        );

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    animation = CurvedAnimation(parent: animation, curve: Curves.ease);
    return SlideTransition(
      position:
          Tween(begin: getBeginOffSet(), end: Offset.zero).animate(animation),
      child: child,
    );
  }

  Offset getBeginOffSet() {
    switch (direction) {
      case AxisDirection.right:
        return const Offset(-1, 0);
      case AxisDirection.left:
        return const Offset(1, 0);
      case AxisDirection.up:
        return const Offset(0, 1);
      case AxisDirection.down:
        return const Offset(0, -1);
    }
  }

  /*CustomPageRoute({required this.child})
      : super(
          transitionDuration: const Duration(seconds: 1),
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secAnimation,
              Widget child) {
            animation = CurvedAnimation(parent: animation, curve: Curves.ease);
            return SlideTransition(
              position: Tween(begin: const Offset(-1, 0), end: Offset.zero)
                  .animate(animation),
              child: child,
            );
          },
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secAnimation) {
            return child;
          },
        );*/
}
