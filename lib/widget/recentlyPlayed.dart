import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:onlinemusicplayer/Screens/playScreen.dart';

class ResentlyPlayed extends StatelessWidget {
  const ResentlyPlayed({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 190,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: 12,
        itemBuilder: (context, index) {
          return Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 150,
                  width: 150,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return PlayScreen();
                      }));
                    },
                    child: Column(
                      children: [
                        Image(
                            height: 130,
                            width: 150,
                            image: NetworkImage(
                                'https://cdn.dribbble.com/users/4515/screenshots/16429419/media/8f3619f70325719a1347e73a98d83dde.jpg?compress=1&resize=400x300')),
                        Text(
                          "SongName",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
