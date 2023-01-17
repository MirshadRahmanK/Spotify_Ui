import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomTxt extends StatelessWidget {
  FontWeight fontWeight;
  String Txt;
  CustomTxt({required this.Txt,required this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Text(
      Txt,
      style: TextStyle(
          fontSize: 25, fontWeight: fontWeight, color: Colors.white),
    );
  }
}
