import 'package:flutter/material.dart';

class PageSadMood extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.red,
      body: Center (
        child: Image.asset('assets/images/smiley_sad.png'),
      ),
    );
  }
}

class PageDisappointedMood extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.grey,
      body: Center (
        child: Image.asset('assets/images/smiley_disappointed.png'),
      ),
    );
  }
}

class PageNormalMood extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.blue,
      body: Center (
        child: Image.asset('assets/images/smiley_normal.png'),
      ),
    );
  }
}

class PageHappyMood extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.orange,
      body: Center (
        child: Image.asset('assets/images/smiley_happy.png'),
      ),
    );
  }
}

class PageVeryHappyMood extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.yellow,
      body: Center (
        child: Image.asset('assets/images/smiley_super_happy.png'),
      ),
    );
  }
}