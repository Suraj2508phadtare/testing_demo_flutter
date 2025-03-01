import 'package:flutter/material.dart';


class AnimationPage extends StatefulWidget {
  const AnimationPage({super.key});

  @override
  State<AnimationPage> createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _widthAnimation;
  late Animation<Color?> _colorAnimation;
  late Animation<double> _boarderRadiusAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _widthAnimation = Tween<double>(begin: 0, end: 200)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    _colorAnimation = ColorTween(begin: Colors.blue, end: Colors.green)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    _boarderRadiusAnimation = Tween<double>(begin: 0, end: 50)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _controller.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();

    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Center(
              child: Container(
                height: _widthAnimation.value,
                width: _widthAnimation.value,
                decoration: BoxDecoration(
                  color: _colorAnimation.value,
                  borderRadius:
                      BorderRadius.circular(_boarderRadiusAnimation.value),
                ),
              ),
            );
          }),
    );
  }
}
