import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:onlinemusicplayer/widget/customText.dart';

class PlayScreen extends StatefulWidget {
  PlayScreen();

  @override
  State<PlayScreen> createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Image(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              image: NetworkImage(
                  'https://cdn.dribbble.com/users/4515/screenshots/16429419/media/8f3619f70325719a1347e73a98d83dde.jpg?compress=1&resize=400x300'),
              fit: BoxFit.cover,
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Color.fromARGB(206, 0, 0, 0),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.white,
                          )),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "SingName",
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.more_horiz,
                            color: Colors.white,
                          ))
                    ],
                  ),
                  Container(
                    height: 400,
                    width: MediaQuery.of(context).size.width,
                    child: SingleChildScrollView(
                      child: Text(
                        "Lorem Ipsum छपाई और अक्षर योजन उद्योग का एक साधारण डमी पाठ है. Lorem Ipsum सन १५०० के बाद से अभी तक इस उद्योग का मानक डमी पाठ मन गया, जब एक अज्ञात मुद्रक ने नमूना लेकर एक नमूना किताब बनाई. यह न केवल पाँच सदियों से जीवित रहा बल्कि इसने इलेक्ट्रॉनिक मीडिया में छलांग लगाने के बाद भी मूलतः अपरिवर्तित रहा. यह 1960 के दशक में Letraset Lorem Ipsum अंश युक्त पत्र के रिलीज के साथ लोकप्रिय हुआ, और हाल ही में Aldus PageMaker Lorem Ipsum के संस्करणों सहित तरह डेस्कटॉप प्रकाशन सॉफ्टवेयर के साथ अधिक प्रचलित हुआ,आम धारणा के विपरीत Lorem Ipsum बस यादृच्छिक (random) पाठ नहीं है. यह 45 ई.पू. से शास्त्रीय लैटिन साहित्य के एक टुकड़े से जुड़ा है, जो इसे 2000 वर्ष से अधिक प्राचीन बनाता है. Richard McClintock, हेम्प्डन-वर्जीनिया में सिडनी कॉलेज में एक लैटिन प्रोफेसर है, ने एक Lorem इप्सुम में से एक और अधिक अस्पष्ट लैटिन शब्द देखा और शास्त्रीय साहित्य के शहर में जाते हुए असंदेहदास्पक स्रोत की खोज की. Lorem Ipsum सिसरौ(Sisero) द्वारा De Finibus Bonorum et Malorum (अच्छाई और बुराई की चरम सीमा) के 1.10.32 और 1.10.33 वर्गों से आता है जो ४५ BC में लिखा गया था. यह पुस्तक नैतिकता के सिद्धांत विषय पर निबंध, जो नवजागरण के दौर का एक बहुत लोकप्रिय ग्रंथ है. Lorem Ipsum की पहली पंक्ति,Lorem ipsum dolor sit amet.., 1.10.32 खंड में एक पंक्ति से आती है.Lorem Ipsum का मानक हिस्सा जिसकी प्रतिलिपि सन 1500 से प्रयोग की जाती है, रुचि रखने वालों के लिए नीचे उपलब्ध है. Cicero द्वारा लिखे गए de Finibus Bonorum et Malorum के खंड 1.10.32 और 1.10.3 भी अपने सटीक मूल रूप में उत्पादित हैं, साथ ही H. Rackham द्वारा 1914 में अंग्रेजी में अनुवादित संस्करण.",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CustomTxt(Txt: 'Songname', fontWeight: FontWeight.bold),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Artist Name',
                          style: TextStyle(color: Colors.grey),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.favorite_border,
                              color: Colors.grey,
                            ))
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
