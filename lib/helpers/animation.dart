import 'package:flutter/material.dart';

class SpinningContainer extends AnimatedWidget {
  const SpinningContainer(
      {Key key, @required AnimationController controller, this.bg})
      : super(key: key, listenable: controller);
  final String bg;
  Animation<double> get _progress => listenable as Animation<double>;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Center(
      
      child: Container(
        height: screenSize.width>800? screenSize.height-300:screenSize.height,
        width: screenSize.width,
        child: Transform.scale(
          scale: _progress.value * 1,
          child: Image.asset(
            'assets/images/$bg.png',
            fit: BoxFit.cover,
            color: Colors.indigo,
            colorBlendMode: BlendMode.multiply,
          ),
        ),
      ),
    );
  }
}
