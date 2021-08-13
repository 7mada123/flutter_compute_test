import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import './markdown_helper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage();

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isLoading = false;
  final htmlData =
      '[](jsonN4IgxgrgzgLg9gWwMIGUUgFwiiAvkA==)img1000(https://i.imgur.com/DseFrA9.png)\nㅤ\nimg1000(https://imgur.com/gEgUjd5.png)\nㅤ\n[ webm(https://files.catbox.moe/nquhvv.mp4) ](https://youtu.be/UJuIh5Yn3W8?t=56)\nㅤ\nimg1000(https://imgur.com/0ydSVv4.png)\nㅤ\nimg1000(https://imgur.com/t8u8y0R.png)\nimg1000(https://imgur.com/Q1H79Gk.png)\nㅤ\nimg10000(https://imgur.com/jpinIV5.png)\nimg10000(https://imgur.com/0hbHIYt.png)\nimg10000(https://imgur.com/jUa8BEE.png)\nㅤ\n[ img1000(https://imgur.com/YJgcDT8.png) ](https://youtu.be/gGrT4_fXI9M?t=139)\n\nimg1000(https://imgur.com/0ydSVv4.png) \nㅤ\nimg1000(https://imgur.com/RHkeHu0.png)\nimg1000(https://imgur.com/KcZFPBm.png)\nㅤ\nimg1000(https://imgur.com/20iySTR.png)\nimg1000(https://imgur.com/dQBeZDc.gif)\n[ img1000(https://imgur.com/BozElBw.png) ](https://anilist.co/studio/2/Kyoto-Animation)\n[ img1000(https://imgur.com/uBQTOZD.png) ](https://anilist.co/anime/20657/Saekano-How-to-Raise-a-Boring-Girlfriend/)\n[ img1000(https://imgur.com/p5skzLK.png) ](https://anilist.co/character/127222/Mai-Sakurajima)\n[ img1000(https://imgur.com/t7pZybL.png) ](https://youtu.be/tMhmftLdsHA?t=5)\nimg1000(https://imgur.com/0ydSVv4.png)\nimg1000(https://imgur.com/JU254Oe.png)\n~~~[ img36(https://imgur.com/x0reIOo.png)‏‏‎ ](https://discord.bio/p/brandonbah) ‎ [ img36(https://imgur.com/R8bbZaC.png)‏‏‎ ](https://twitter.com/bdn_bh) ‎ [ img36(https://imgur.com/1zupAFN.png) ](https://steamcommunity.com/id/BrandonBah/)  ‎[ img36(https://imgur.com/0FJ54X8.png) ](https://osu.ppy.sh/users/14897283)‏‏‏‏‎‏‏‎‏‏‎~~~‎‎\nimg1000(https://imgur.com/0ydSVv4.png)\n\n~~~[ img50(https://s4.anilist.co/file/anilistcdn/user/avatar/large/b5311416-nXVW4umY5XCA.png) ](https://anilist.co/user/Indra/)[ img50(https://s4.anilist.co/file/anilistcdn/user/avatar/large/b5381554-X1kJgGjhHMX6.jpg) ](https://anilist.co/user/gugaku/)[ img50(https://s4.anilist.co/file/anilistcdn/user/avatar/large/b726270-AtCC8pyJbGsj.png) ](https://anilist.co/user/skylarsays)[ img50(https://s4.anilist.co/file/anilistcdn/user/avatar/large/b981030-5aePf90l4YQf.png) ](https://anilist.co/user/startni/)[ img50(https://s4.anilist.co/file/anilistcdn/user/avatar/large/b5105911-cTBpAqGBBDiP.png) ](https://anilist.co/user/wryznn/)[ img50(https://s4.anilist.co/file/anilistcdn/user/avatar/large/b5232975-xwgI9kTQ77xW.png) ](https://anilist.co/user/groggy1/)[ img50(https://s4.anilist.co/file/anilistcdn/user/avatar/large/b962339-eorFkNKt8jSl.png) ](https://anilist.co/user/absurdit/)[ img50(https://s4.anilist.co/file/anilistcdn/user/avatar/large/b5229937-b6FeGixjVvvN.png) ](https://anilist.co/user/benjiwantsbread)[ img50(https://s4.anilist.co/file/anilistcdn/user/avatar/large/b5125211-594yYpQINBuA.png) ](https://anilist.co/user/labeeba/)[ img50(https://s4.anilist.co/file/anilistcdn/user/avatar/large/b5153099-da2r2q4h7Ajj.png) ](https://anilist.co/user/braindead)[ img50(https://s4.anilist.co/file/anilistcdn/user/avatar/large/b863093-3nnHkkNcvqQS.png) ](https://anilist.co/user/afuckingweeb)[ img50(https://s4.anilist.co/file/anilistcdn/user/avatar/large/b596276-QuZxUOlXMUBq.jpg) ](https://anilist.co/user/omnisious6)[ img50(https://s4.anilist.co/file/anilistcdn/user/avatar/large/b870797-cwse49Mq2ejq.jpg) ](https://anilist.co/user/polar/)[ img50(https://s4.anilist.co/file/anilistcdn/user/avatar/large/b392867-Af1EPChz835I.png) ](https://anilist.co/user/FlowerSun/)[ img50(https://s4.anilist.co/file/anilistcdn/user/avatar/large/b911593-Ktf69svAtw2j.png) ](https://anilist.co/user/EngobruhNeverExisted)[ img50(https://s4.anilist.co/file/anilistcdn/user/avatar/large/b576505-0s6GGLLFrq6l.png) ](https://anilist.co/user/burwan)[ img50(https://s4.anilist.co/file/anilistcdn/user/avatar/large/b5162682-GXORHiPugMFm.png) ](https://anilist.co/user/YoungOtakv/)[ img50(https://s4.anilist.co/file/anilistcdn/user/avatar/large/b57547-IqFY8Q7J0LQQ.png) ](https://anilist.co/user/Whosthatkiddx/)[ img50(https://s4.anilist.co/file/anilistcdn/user/avatar/large/b626525-xBOKHZbv8wwA.png) ](https://anilist.co/user/Budwii3245/)~~~\n\nㅤ\n~~~ <a href=\"https://info.flagcounter.com/5brp\"><img src=\"https://s04.flagcounter.com/mini/5brp/bg_a267b5/txt_000000/border_a267b5/flags_0/\" alt=\"Flag Counter\" border=\"0\"></a> ~~~';

  Future<void> computeTest() async {
    setState(() => isLoading = true);

    await compute(computeData, htmlData);

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 40),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    computeTest();
                  },
                  child: Text('Run test'),
                ),
              ),
              const SizedBox(height: 50),
              isLoading
                  ? SizedBox(
                      height: 100,
                      width: 100,
                      child: CircularProgressIndicator(),
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}

String computeData(String aniListHtml) {
  return aniListHtml.convertMarkDown();
}
