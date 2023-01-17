import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:onlinemusicplayer/Screens/playScreen.dart';

class FreshNewMusic extends StatelessWidget {
  const FreshNewMusic({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190,
      width: MediaQuery.of(context).size.width,
      child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('Fresh new music')
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: snapshot.data!.docs.map((dataas) {
                  return Expanded(
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () => Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return PlayScreen();
                          })),
                          child: Column(children: [
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 150,
                                width: 150,
                                child: Column(
                                  children: [
                                    Image(
                                      height: 130,
                                      width: 150,
                                      image: NetworkImage(dataas['Poster Url']),
                                      fit: BoxFit.cover,
                                    ),
                                    Text(
                                      "${dataas['Song name']}",
                                      style: TextStyle(color: Colors.white),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ]),
                        );
                      },
                    ),
                  );
                }).toList(),
              );
            } else {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 150,
                  width: 150,
                  color: Colors.grey[200],
                ),
              );
            }
          }),
    );
  }
}
