import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AnimationsDemo extends StatelessWidget {
  const AnimationsDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Animations demo")),
      body: Column(
        children: [
          Center(
            child: 
              LogoSimpleWidget(),
          ),
          Center(
            child: LogoWidget(),
          ),
          Center(
            child: LogoBuiltWidget()
          )
        ],
      ),
    );
  }
}

class LogoSimpleWidget extends StatefulWidget {
  const LogoSimpleWidget({super.key});

  @override
  State<LogoSimpleWidget> createState() => _LogoSimpleWidgetState();
}

class _LogoSimpleWidgetState extends State<LogoSimpleWidget> with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    // animation = Tween<double>(begin: 10, end: 300).animate(controller)
    animation = Tween<double>(begin: 10, end: 300).animate(controller)
      ..addListener(() {
        setState(() {
          // The state that has changed here is the animation object's value.
        });
      })
      ..addStatusListener((status) { 
        print('$status'); 
        if (status == AnimationStatus.completed) {
          controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      height: 
      //300 - animation.value,
      animation.value,
      width: 
      animation.value,
      child: const FlutterLogo(),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class LogoBuiltWidget extends StatefulWidget {
  const LogoBuiltWidget({super.key});

  @override
  State<LogoBuiltWidget> createState() => _LogoBuiltWidgetState();
}

class _LogoBuiltWidgetState extends State<LogoBuiltWidget> with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: Duration(seconds: 2));
    animation = CurvedAnimation(parent: controller, curve: Curves.bounceIn);
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return GrowTransition(
      animation: animation,
      child: const LogoWidget(),
    );
  }
}

class GrowTransition extends StatelessWidget {
  const GrowTransition({
    required this.child,
    required this.animation,
    super.key,
  });

  final Widget child;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          return SizedBox(
            height: animation.value,
            width: animation.value,
            child: child,
          );
        },
        child: child,
      ),
    );
  }
}


class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  // Leave out the height and width so it fills the animating parent.
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: const Icon(Icons.reviews),
    );
  }
}
