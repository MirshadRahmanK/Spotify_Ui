import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:onlinemusicplayer/Screens/loginScreen.dart';
import 'package:onlinemusicplayer/widget/customText.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

String? songUrl;
String? Songfilename;
String? Songfilepath;
String? imageFilename;
String? imageFilepath;

getSong() async {
  final songPicker = await FilePicker.platform.pickFiles(
    type: FileType.audio,
  );
  Songfilename = songPicker!.files.single.name;
  Songfilepath = songPicker.files.single.path;
}

getPoster() async {
  final posterPicker = await FilePicker.platform.pickFiles(
    type: FileType.image,
  );
  imageFilename = posterPicker!.files.single.name;
  imageFilepath = posterPicker.files.single.path;
}

String? songCategory;
bool isSelected = true;
TextEditingController songNameController = TextEditingController();

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.logout,
                  color: Colors.white,
                ))
          ],
          backgroundColor: Colors.black,
          title: CustomTxt(Txt: 'Profile', fontWeight: FontWeight.w500),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://cdn.dribbble.com/users/4515/screenshots/16429419/media/8f3619f70325719a1347e73a98d83dde.jpg?compress=1&resize=400x300'),
                          fit: BoxFit.fill),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomTxt(Txt: "Test", fontWeight: FontWeight.w300),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return SimpleDialog(
                            children: [
                              Container(
                                height: 300,
                                width: 100,
                                color: Colors.white,
                                child: Column(
                                  children: [
                                    ListTile(
                                      leading: Text(
                                        "Upload your music",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      trailing: TextButton(
                                          onPressed: () {
                                            getSong();
                                          },
                                          child: Text('Choose File')),
                                    ),
                                    ListTile(
                                      leading: Text(
                                        "Upload your poster",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      trailing: TextButton(
                                          onPressed: () async {
                                            getPoster();
                                          },
                                          child: Text('Choose File')),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextFormField(
                                        controller: songNameController,
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            hintText: 'Enter song name'),
                                      ),
                                    ),
                                    DropdownButton<String>(
                                      onChanged: (value) {
                                        songCategory = value;
                                        print(songCategory);
                                      },
                                      hint: Text("Select Upload Type"),
                                      items: <String>[
                                        'Fresh new music',
                                        'Popular music'
                                      ].map((String value) {
                                        return DropdownMenuItem<String>(
                                            value: value, child: Text(value));
                                      }).toList(),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    GestureDetector(
                                      onTap: () async {
                                        final storage =
                                            FirebaseStorage.instance;
                                        final firestore =
                                            FirebaseFirestore.instance;
                                        final uploadSong = await storage
                                            .ref()
                                            .child('Songs/$Songfilename')
                                            .putFile(File(Songfilepath!));
                                        String audioUrl = await uploadSong.ref
                                            .getDownloadURL();
                                        final uploadPoster = await storage
                                            .ref()
                                            .child("Poster/$imageFilename")
                                            .putFile(File(imageFilepath!));
                                        String posterUrl = await uploadPoster
                                            .ref
                                            .getDownloadURL();
                                        firestore
                                            .collection(songCategory!)
                                            .add({
                                          'Song name': songNameController.text,
                                          'Poster Url': posterUrl,
                                          'Music Url': audioUrl,
                                        });
                                        Navigator.pop(context);
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)),
                                            color: Colors.blue),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            "Upload",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          );
                        },
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Upload",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Expanded(
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://cdn.dribbble.com/users/4515/screenshots/16429419/media/8f3619f70325719a1347e73a98d83dde.jpg?compress=1&resize=400x300'),
                      ),
                      title: Text(
                        "Song Name",
                        style: TextStyle(color: Colors.white),
                      ),
                      subtitle: Text(
                        "Artist Name",
                        style: TextStyle(color: Colors.grey),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ));
  }
}
