import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
// import 'package:gamesapp/widgets/top_picks_widget/top_picks.dart';
import 'package:gamesapp/widgets/trending_games_widget/trendingGamesWidget.dart';

import '../game_list/game_list.dart';

class MainScreenWidget extends StatefulWidget {
  const MainScreenWidget({Key? key}) : super(key: key);

  @override
  State<MainScreenWidget> createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
  int selectedTab = 0;
  static const TextStyle newStyle = TextStyle(color: Colors.white);
    void onSelectedTab(int index) {
    if (selectedTab == index) {
      return;
    }
    setState(() {
      selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RAWG'),
      ),
      body: IndexedStack(
        index: selectedTab,
        children: const [
          // TopPicksWidget(),
          TrendingGamesWidget(),
          GameListWidget(),
          Text(
            'Index 2: Everything',
            style: newStyle,
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true,
                selectedLabelStyle: TextStyle(color: Colors.white),
                currentIndex: selectedTab,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.trending_up),
              label: 'Trending',
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: Icon(Icons.videogame_asset_sharp),
              label: 'All Games',
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'Menu',
              backgroundColor: Colors.black),
          // BottomNavigationBarItem(
          //     icon: Icon(Icons.hotel_class),
          //     label: 'This week',
          //     backgroundColor: Colors.black),
          // BottomNavigationBarItem(
          //     icon: Icon(Icons.wine_bar),
          //     label: 'Best',
          //     backgroundColor: Colors.black),
        ],
        onTap: onSelectedTab,
      ),
    );
  }
}
