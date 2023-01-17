import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:onlinemusicplayer/Screens/libraryScreen.dart';
import 'package:onlinemusicplayer/Screens/listPage.dart';
import 'package:onlinemusicplayer/Screens/loginScreen.dart';
import 'package:onlinemusicplayer/Screens/searchScreen.dart';
import 'package:onlinemusicplayer/widget/appbar.dart';
import 'package:onlinemusicplayer/widget/customText.dart';
import 'package:onlinemusicplayer/widget/freshNewMusic.dart';
import 'package:onlinemusicplayer/widget/homePageContainer.dart';
import 'package:onlinemusicplayer/widget/popularArtist.dart';
import 'package:onlinemusicplayer/widget/popularMusic.dart';
import 'package:onlinemusicplayer/widget/recentlyPlayed.dart';

class HomeScreen extends StatefulWidget {

  HomeScreen();

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

int bottomIndex = 0;
List ScreenList = [
  ListSongPage(),
  SearchScreen(),
  LibraryScreen(),
];

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            bottomNavigationBar: BottomNavigationBar(
                fixedColor: Colors.white,
                currentIndex: bottomIndex,
                onTap: (index) {
                  setState(() {
                    bottomIndex = index;
                  });
                },
                backgroundColor: Colors.black,
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.home_filled,
                        color: Colors.white,
                      ),
                      label: 'Home',
                      backgroundColor: Colors.white),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      label: 'Search'),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.library_music_outlined,
                        color: Colors.white,
                      ),
                      label: 'Library'),
                ]),
            body: ScreenList[bottomIndex]));
  }
}
