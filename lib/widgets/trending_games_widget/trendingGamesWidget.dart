import 'package:flutter/material.dart';

class Games {
  final int id;
  final String gameName;
  final String gameImage;

  Games({required this.id, required this.gameName, required this.gameImage});
}

class TrendingGamesWidget extends StatefulWidget {
  const TrendingGamesWidget({Key? key}) : super(key: key);

  @override
  State<TrendingGamesWidget> createState() => _TrendingGamesWidgetState();
}

class _TrendingGamesWidgetState extends State<TrendingGamesWidget> {
  final List<Games> myGames = [
    Games(
        id: 1,
        gameName: 'Vamprire: The Masuerade - Bloodlines 2',
        gameImage: ('images/trending/trending1.jpg')),
    Games(id: 2, gameName: 'Stray', gameImage: ('images/trending/trending2.jpg')),
    Games(
        id: 3,
        gameName: 'S.T.A.L.K.E.R. 2: Heart of Chornobyl',
        gameImage: ('images/trending/trending3.jpg')),
    Games(id: 4, gameName: 'Teenage Mutant Ninja Turtles: Shredder Revenge', gameImage: ('images/trending/trending4.jpg')),
    Games(
        id: 5,
        gameName: 'Senua Saga: Hellblade 2',
        gameImage: ('images/trending/trending5.jpg')),
    Games(
        id: 6,
        gameName: 'MultiVersus',
        gameImage: ('images/trending/trending6.jpg')),
    Games(
        id: 7, gameName: 'Starfield', gameImage: ('images/trending/trending7.jpg')),
  ];

  final searchController = TextEditingController();
  var filterGames = <Games>[];
  void searchGames() {
    final query = searchController.text;
    if (query.isNotEmpty) {
      filterGames = myGames.where((Games games) {
        return games.gameName.toLowerCase().contains(query.toLowerCase());
      }).toList();
    } else {
      filterGames = myGames;
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    filterGames = myGames;
    searchController.addListener(searchGames);
  }

  void onGamePressed(int index) {
    final id = myGames[index].id;
    Navigator.of(context)
        .pushNamed('/mainscreen/game_details_widget',
        arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    //const imageGame = AssetImage('images/gameimage1.jpg');
    return Stack(
      children: [
        ListView.builder(
            padding: const EdgeInsets.only(top: 69.0),
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            itemCount: filterGames.length,
            itemExtent: 440.0,
            itemBuilder: (BuildContext context, int index) {
              final currentGame = filterGames[index];
              return Container(
                height: 440.0,
                margin: const EdgeInsets.all(5.0),
                decoration: const BoxDecoration(
                  color: Colors.white10,
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
                child: Column(
                  children: [
                    ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(20.0)),
                        child: Image(image: AssetImage(currentGame.gameImage))),
                    TextButton(
                        onPressed: () => onGamePressed(index),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            currentGame.gameName,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontSize: 25.0,
                                color: Colors.white,
                                fontWeight: FontWeight.w800),
                          ),
                        )),
                    Row(
                      children: const [
                        NumberPeoplePlay(
                          text: '1234',
                        ),
                        AddToWishlist(),
                        GamesDropDown(),
                      ],
                    ),
                    const ViewMoreButton(),
                  ],
                ),
              );
            }),
        Container(
          margin: EdgeInsets.only(top: 10.0),
          child: TextField(
              cursorColor: Colors.white,
              controller: searchController,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                label: const Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                suffixIcon: IconButton(
                    onPressed: () => searchController.clear(),
                    icon: const Icon(
                      Icons.clear,
                      color: Colors.white,
                    )),
                labelStyle: const TextStyle(color: Colors.white),
                //labelText: 'Search',
                filled: true,
                fillColor: Colors.black26.withAlpha(200),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide:
                    const BorderSide(color: Colors.white30, width: 1.0)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide:
                    const BorderSide(color: Colors.white30, width: 1.0)),
              )),
        ),
      ],
    );
  }
}

class ViewMoreButton extends StatelessWidget {
  const ViewMoreButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {},
        child: Text(
            style: TextStyle(
                color: Colors.white,
                decoration: TextDecoration.underline,
                decorationThickness: 2.0),
            'View more'));
  }
}

class AddToWishlist extends StatelessWidget {
  const AddToWishlist({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10.0),
      child: ElevatedButton(
          style: ButtonStyle(
              maximumSize: MaterialStateProperty.all(Size.infinite),
              backgroundColor: MaterialStateProperty.all(Colors.white12)),
          onPressed: () {},
          child: const Icon(Icons.card_giftcard_outlined)),
    );
  }
}

class NumberPeoplePlay extends StatefulWidget {
  final String text;
  const NumberPeoplePlay({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  State<NumberPeoplePlay> createState() => _NumberPeoplePlayState();
}

class _NumberPeoplePlayState extends State<NumberPeoplePlay> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10.0),
      child: ElevatedButton.icon(
        style: ButtonStyle(
            maximumSize: MaterialStateProperty.all(Size.infinite),
            backgroundColor: MaterialStateProperty.all(Colors.white12)),
        onPressed: () {},
        label: Text(widget.text),
        icon: const Icon(Icons.add),
      ),
    );
  }
}

class GamesDropDown extends StatefulWidget {
  const GamesDropDown({Key? key}) : super(key: key);

  @override
  State<GamesDropDown> createState() => _GamesDropDownState();
}

class _GamesDropDownState extends State<GamesDropDown> {
  String dropDownValue = 'More';
  void dropdownCallback(String? selectedValue) {
    setState(() {
      dropDownValue = selectedValue!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10.0),
      child: Container(
        alignment: Alignment.center,
        height: 36.0,
        width: 64.0,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
          color: Colors.white12,
        ),
        child: DropdownButton(
            underline: Container(),
            dropdownColor: Colors.white10,
            items: const [
              DropdownMenuItem(
                value: 'More',
                child: Icon(
                  Icons.more_horiz_outlined,
                  color: Colors.white,
                ),
              ),
              DropdownMenuItem(
                value: 'Feedback',
                child: Icon(Icons.text_snippet, color: Colors.white),
              ),
              DropdownMenuItem(
                  value: 'Great!',
                  child: Icon(Icons.thumb_up, color: Colors.white)),
              DropdownMenuItem(
                  value: 'Bad',
                  child: Icon(Icons.thumb_down, color: Colors.white)),
              DropdownMenuItem(
                  value: 'Next',
                  child: Icon(Icons.skip_next, color: Colors.white))
            ],
            value: dropDownValue,
            onChanged: dropdownCallback),
      ),
    );
  }
}