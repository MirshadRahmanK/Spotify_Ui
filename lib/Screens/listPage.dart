import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:onlinemusicplayer/widget/customText.dart';
import 'package:onlinemusicplayer/widget/freshNewMusic.dart';
import 'package:onlinemusicplayer/widget/homePageContainer.dart';
import 'package:onlinemusicplayer/widget/popularMusic.dart';
import 'package:onlinemusicplayer/widget/recentlyPlayed.dart';

import '../widget/appbar.dart';
import '../widget/popularArtist.dart';

class ListSongPage extends StatefulWidget {

   ListSongPage();

  @override
  State<ListSongPage> createState() => _ListSongPageState();
}

class _ListSongPageState extends State<ListSongPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          HomePageContainer(),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 20),
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                SizedBox(
                  height: 30,
                ),
                AppbarCustom(),
                ResentlyPlayed(),
                Column(
                  children: [
                    ListTile(
                      subtitle: Text(
                        "Your2022 in review",
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                      title: Text(
                        "#SPOTIFYWARPPED",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 9, right: 9),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        child: Image(
                            image: NetworkImage(
                                'https://cdn.dribbble.com/users/4515/screenshots/16429419/media/8f3619f70325719a1347e73a98d83dde.jpg?compress=1&resize=400x300')),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CustomTxt(
                            Txt: 'Fresh new music',
                            fontWeight: FontWeight.w600,
                          ),
                        ],
                      ),
                    ),
                    FreshNewMusic(),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CustomTxt(
                            Txt: 'Popular music',
                            fontWeight: FontWeight.w600,
                          ),
                        ],
                      ),
                    ),
                    PopularMusic(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CustomTxt(
                          Txt: 'Popular artist',
                          fontWeight: FontWeight.w600,
                        ),
                      ],
                    ),
                    PopularArtist(),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
