import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';

class GamePageWidget extends StatefulWidget {
  static const List<String> scrollImage = [
    'images/grandtheftscreenshots/screenshot1.jpg',
    'images/grandtheftscreenshots/screenshot2.jpg',
    'images/grandtheftscreenshots/screenshot3.jpg',
    'images/grandtheftscreenshots/screenshot4.jpg',
    'images/grandtheftscreenshots/screenshot5.jpg'
  ];

  const GamePageWidget({Key? key}) : super(key: key);

  @override
  State<GamePageWidget> createState() => _GamePageWidgetState();
}

class _GamePageWidgetState extends State<GamePageWidget> {
  List<Widget> getPicture() {
    List<Widget> imageContainer = [];
    GamePageWidget.scrollImage.forEach((element) {
      imageContainer.add(Container(
          padding: const EdgeInsets.only(right: 10.0),
          height: 150,
          width: 200,
          child: Image(
            image: AssetImage(element),
          )));
    });
    return imageContainer;
  }

  final String textDescription =
      'Rockstar Games went bigger, since their previous installment of the series. You get the complicated and realistic world-building from Liberty City of GTA4 in the setting of lively and diverse Los Santos, from an old fan favorite GTA San Andreas. 561 different vehicles (including every transport you can operate) and the amount is rising with every update.'
      'Simultaneous storytelling from three unique perspectives: Follow Michael, ex-criminal living his life of leisure away from the past, Franklin, a kid that seeks the better future, and Trevor, the exact past Michael is trying to run away from. GTA Online will provide a lot of additional challenge even for the experienced players, coming fresh from the story mode. Now you will have other players around that can help you just as likely as ruin your mission. Every GTA mechanic up to date can be experienced by players through the unique customizable character, and community content paired with the leveling system tends to keep everyone busy and engaged.';

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 280,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/gameimage1.jpg'),
                      opacity: 0.3)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 20.0),
                  const ReleaseDateWidget(releaseDate: 'SEP 17 2013'),
                  const SizedBox(height: 10.0),
                  const AveragePlaytimeWidget(
                    averagePlaytimeText: 'AVERAGE PLAYTIME: 72 HOURS',
                  ),
                  const SizedBox(height: 15.0),
                  const GameNameWidget(
                    gameName: 'Grand Theft Auto 5',
                  ),
                  Scrollbar(
                    thickness: 2.0,
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.only(top: 13.0),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: getPicture(),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
        const MyGameButton(
          buttonName: 'My games',
          buttonIcon: Icons.add_circle_outline_rounded,
        ),
        const MyGameButton(
            buttonName: 'Add to wishlist',
            buttonIcon: Icons.local_fire_department_outlined),
        const LikeGameWidget(),
        const SizedBox(height: 15.0),
        GameDescriptionWidget(textDescription: textDescription),
        const SizedBox(height: 15.0),
        const GameExtraInformation(
            blockTitle: 'Platforms',
            extraInformation:
                'PC, Xbox Series S/X, PlayStation 4, PlayStation 3, Xbox 360, Xbox One, PlayStation 5'),
        const GameExtraInformation(
            blockTitle: 'Website',
            extraInformation: 'http://www.rockstargames.com/V/'),
      ],
    );
  }
}

class GameDescriptionWidget extends StatelessWidget {
  const GameDescriptionWidget({
    Key? key,
    required this.textDescription,
  }) : super(key: key);

  final String textDescription;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ExpandableTheme(
          data: const ExpandableThemeData(
            iconColor: Colors.white,
          ),
          child: ExpandablePanel(
            header: const Text(
              'About',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            ),
            collapsed: Text(
              textDescription,
              softWrap: true,
              maxLines: 10,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  color: Colors.white60,
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
            ),
            expanded: Text(
              textDescription,
              softWrap: true,
              style: const TextStyle(
                  color: Colors.white60,
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
            ),
          )),
    );
  }
}

class LikeGameWidget extends StatefulWidget {
  const LikeGameWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<LikeGameWidget> createState() => _LikeGameWidgetState();
}

class _LikeGameWidgetState extends State<LikeGameWidget> {
  var a = 1;
  var b = 1;
  var c = 1;
  var d = 1;

  callBack1() {
    setState(() {
      a++;
    });
  }

  callBack2() {
    setState(() {
      b++;
    });
  }

  callBack3() {
    setState(() {
      c++;
    });
  }

  callBack4() {
    setState(() {
      d++;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: a,
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5.0),
                      bottomLeft: Radius.circular(5.0))),
              child: TextButton(onPressed: callBack1, child: Text(style: const TextStyle(color: Colors.black),'$a')),
            ),
          ),
          Expanded(
            flex: b,
            child: Container(
              color: Colors.lightBlue,
              child: TextButton(onPressed:callBack2, child: Text(style: const TextStyle(color: Colors.black),'$b')),
            ),
          ),
          Expanded(
            flex: c,
            child: Container(
              color: Colors.orange,
              child: TextButton(onPressed: callBack3, child: Text(style: const TextStyle(color: Colors.black),'$c')),
            ),
          ),
          Expanded(
            flex: d,
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(5.0),
                      bottomRight: Radius.circular(5.0))),
              child: TextButton(onPressed: callBack4, child: Text(style: const TextStyle(color: Colors.black),'$d')),
            ),
          ),
        ],
      ),
    );
  }
}

class GameExtraInformation extends StatelessWidget {
  final String blockTitle;
  final String extraInformation;
  const GameExtraInformation({
    Key? key,
    required this.blockTitle,
    required this.extraInformation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              blockTitle,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(height: 15.0),
          Text(
            extraInformation,
            softWrap: true,
            style: const TextStyle(
                color: Colors.white60,
                fontSize: 16.0,
                fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}

class MyGameButton extends StatelessWidget {
  final String buttonName;
  final IconData buttonIcon;
  const MyGameButton({
    Key? key,
    required this.buttonName,
    required this.buttonIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          const EdgeInsets.only(left: 8.0, right: 8.0, top: 2.0, bottom: 4.0),
      child: ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(
            minimumSize: MaterialStateProperty.all(const Size(366, 48)),
            padding: MaterialStateProperty.all(
                const EdgeInsets.symmetric(horizontal: 20.0)),
            backgroundColor: MaterialStateProperty.all(Colors.white)),
        child: Row(
          children: [
            SizedBox(
              width: 312.0,
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                      style: const TextStyle(color: Colors.black, fontSize: 16.0),
                      buttonName)),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Icon(color: Colors.black, buttonIcon),
            ),
          ],
        ),
      ),
    );
  }
}

class GameNameWidget extends StatelessWidget {
  final String gameName;
  const GameNameWidget({
    Key? key,
    required this.gameName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
        style: TextStyle(
            color: Colors.white, fontSize: 32, fontWeight: FontWeight.w600),
        gameName);
  }
}

class AveragePlaytimeWidget extends StatelessWidget {
  final String averagePlaytimeText;
  const AveragePlaytimeWidget({
    Key? key,
    required this.averagePlaytimeText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
        style: TextStyle(
            color: Colors.white,
            fontSize: 12.0,
            fontWeight: FontWeight.w500,
            letterSpacing: 2),
        averagePlaytimeText);
  }
}

class ReleaseDateWidget extends StatelessWidget {
  final String releaseDate;
  const ReleaseDateWidget({
    Key? key,
    required this.releaseDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 20,
        width: 100,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(5.0)),
        child: Center(
            child: Text(
                style: TextStyle(color: Colors.black, wordSpacing: 3.0),
                releaseDate)),
      ),
    );
  }
}
