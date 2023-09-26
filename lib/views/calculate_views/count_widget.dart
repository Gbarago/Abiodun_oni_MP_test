import 'package:flutter/material.dart';

class CountingNumberAnimation extends StatefulWidget {
  @override
  _CountingNumberAnimationState createState() =>
      _CountingNumberAnimationState();
}

class _CountingNumberAnimationState extends State<CountingNumberAnimation> {
  int targetNumber = 1378; // The number to count up to
  int currentNumber = 0; // The current number to display

  @override
  void initState() {
    super.initState();

    // Start the counting animation
    startCountingAnimation();
  }

  void startCountingAnimation() {
    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        currentNumber = targetNumber;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: Duration(seconds: 1), // Animation duration
      tween: IntTween(begin: 0, end: currentNumber),
      builder: (context, int value, child) {
        return RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: '\$${value.toString()}',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                  color: Colors.greenAccent,
                ),
              ),
              TextSpan(
                text: 'USD',
                style: TextStyle(
                  fontSize: 25, // Adjust the font size for "USD"
                  fontWeight: FontWeight.w500,
                  color: Colors.greenAccent,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
