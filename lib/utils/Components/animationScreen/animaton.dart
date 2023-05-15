import 'package:flutter/material.dart';

class AnimatedBg extends StatelessWidget {
  const AnimatedBg({
    super.key,
    required AnimationController controller,
    required Animation<Alignment> topAlignmentAnimation,
    required Animation<Alignment> bottomAlignmentAnimation,
  })  : _controller = controller,
        _topAlignmentAnimation = topAlignmentAnimation,
        _bottomAlignmentAnimation = bottomAlignmentAnimation;

  final AnimationController _controller;
  final Animation<Alignment> _topAlignmentAnimation;
  final Animation<Alignment> _bottomAlignmentAnimation;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, Widget? child) {
        return Container(
          width: size.width,
          height: size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: _topAlignmentAnimation.value,
              end: _bottomAlignmentAnimation.value,
              colors: [
                Color.fromRGBO(0, 77, 145, 0),
                Color.fromRGBO(0, 77, 145, 0.626),
                Color.fromRGBO(1, 62, 169, 0),
                Color.fromRGBO(1, 62, 169, 0),
                Color.fromRGBO(1, 62, 169, 0),
                Color.fromRGBO(1, 62, 169, 0),
               
              ],
            ),
            borderRadius: BorderRadius.circular(20),
          ),
        );
      },
    );
  }
}
