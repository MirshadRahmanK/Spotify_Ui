import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:onlinemusicplayer/widget/customText.dart';
import 'package:onlinemusicplayer/widget/searchBar.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: ListView(
            children: [
              CustomTxt(
                Txt: 'Search',
                fontWeight: FontWeight.bold,
              ),
              SearchBar(),
              SizedBox(
                height: 20,
              ),
              Image(
                height: 250,
                width: MediaQuery.of(context).size.width,
                image: NetworkImage(
                    'https://cdn.dribbble.com/users/4515/screenshots/16429419/media/8f3619f70325719a1347e73a98d83dde.jpg?compress=1&resize=400x300'),
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child:
                    CustomTxt(Txt: 'Browse all', fontWeight: FontWeight.w600),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 130,
                      width: 160,
                      decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CustomTxt(
                            Txt: 'Popular music', fontWeight: FontWeight.w600),
                      ),
                    ),
                    Container(
                      height: 130,
                      width: 160,
                      decoration: BoxDecoration(
                          color: Colors.redAccent,
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomTxt(
                            Txt: 'Fresh new music',
                            fontWeight: FontWeight.w600),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
