import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class LikedSongs extends StatelessWidget {
  const LikedSongs({super.key});

  @override
  Widget build(BuildContext context) {
    return  ListTile(
              leading: Container(
                height: 100,
                width: 80,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Color(0xffeeaeca), Color(0xff94bbe9)])),
                child: Center(
                  child: Icon(
                    Icons.favorite,
                    color: Colors.white,
                  ),
                ),
              ),
              title: Text(
                "Liked Songs",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              subtitle: Text(
                'Songs :3',
                style: TextStyle(color: Colors.grey),
              ),
            );
  }
}