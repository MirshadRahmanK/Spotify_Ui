import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:onlinemusicplayer/Screens/profileScreen.dart';
import 'package:onlinemusicplayer/widget/customText.dart';

class SettingsScreen extends StatelessWidget {
  
  SettingsScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: CustomTxt(Txt: 'Settings', fontWeight: FontWeight.w500),
          centerTitle: true,
        ),
        body: Column(
          children: [
            GestureDetector(
              onTap: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) {
                return ProfileScreen(
                 
                );
              })),
              child: ListTile(
                title: Text(
                  "Profile",
                  style: TextStyle(color: Colors.white),
                ),
                trailing: Icon(
                  Icons.keyboard_arrow_right,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ));
  }
}
