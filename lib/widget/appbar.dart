import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:onlinemusicplayer/Screens/settings.dart';
import 'package:onlinemusicplayer/widget/customText.dart';

class AppbarCustom extends StatelessWidget {
 
   AppbarCustom();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomTxt(
          Txt: 'Recently played',
          fontWeight: FontWeight.w600,
        ),
        Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.notifications, color: Colors.white),
            ),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.history,
                  color: Colors.white,
                )),
            IconButton(
                onPressed: () => Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return SettingsScreen();
                    })),
                icon: Icon(
                  Icons.settings,
                  color: Colors.white,
                ))
          ],
        )
      ],
    );
  }
}
