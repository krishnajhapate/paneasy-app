import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paneasy/controllers/splashController.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;
  bool _isAnimationCompleted = false;
  final SplashController customerController = Get.put(SplashController());

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    // Fade-in animation
    _fadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(_animationController);

    // Scale animation
    _scaleAnimation = Tween<double>(
      begin: 1,
      end: 100,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.6, 1.0,
            curve: Curves.fastOutSlowIn), // Adjust interval as needed
      ),
    );

    // Start the animations after 3 seconds
    Future.delayed(Duration(seconds: 3), () {
      _animationController.forward();
      setState(() {
        _isAnimationCompleted = true;
      });
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: _isAnimationCompleted
            ? FadeTransition(
                opacity: _fadeAnimation,
                child: ScaleTransition(
                  scale: _scaleAnimation,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 120,
                        backgroundColor: Colors.white.withOpacity(.30),
                        child: Padding(
                          padding: const EdgeInsets.all(40.0),
                          child: Icon(
                            Icons.recent_actors, // or any other relevant icon
                            size: 130, // adjust size as needed
                            color: Colors.white, // adjust color as needed
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Text(
                          'Pan Easy',
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                      )
                    ],
                  ),
                ),
              )
            : LogoInstantLoad(), // Show instant logo load
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('version 1.0'),
          ],
        ),
      ),
    );
  }
}

class LogoInstantLoad extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 120,
          backgroundColor: Colors.white.withOpacity(.30),
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Icon(
              Icons.recent_actors, // or any other relevant icon
              size: 130, // adjust size as needed
              color: Colors.white, // adjust color as needed
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10),
          child: Text(
            'Pan Easy',
            style: Theme.of(context).textTheme.displayMedium,
          ),
        )
      ],
    );
  }
}
