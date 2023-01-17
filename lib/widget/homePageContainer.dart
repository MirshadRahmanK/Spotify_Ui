import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePageContainer extends StatelessWidget {
  const HomePageContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Color.fromARGB(255, 169, 229, 241).withOpacity(1.0),
          Colors.black,
          Colors.black,
          Colors.black,
          Colors.black,
          Colors.black,
        ], begin: Alignment.topLeft, end: Alignment(0.100, 0)),
      ),
    );
  }
}
