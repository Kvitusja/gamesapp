import 'package:flutter/material.dart';
import 'package:gamesapp/themes/app_colours.dart';
import 'package:gamesapp/widgets/auth/login.dart';
import 'package:gamesapp/widgets/game_details_widget/gameDetails.dart';
import 'package:gamesapp/widgets/game_details_widget/noSuchGame.dart';
import 'package:gamesapp/widgets/main_screen_widget/main_screen_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.myMainColor,
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            selectedIconTheme: IconThemeData(
                color: AppColors
                    .myBottomBarColor), //seColor: AppColors.myBottomBarColor,
            unselectedIconTheme:
                IconThemeData(color: AppColors.myBottomBarColor),
            backgroundColor: AppColors.myMainColor),
        appBarTheme: const AppBarTheme(backgroundColor: AppColors.myMainColor),
      ),
      home: AuthWidget(),
      routes: {
        '/login': (context) => AuthWidget(),
        '/mainscreen': (context) => MainScreenWidget(),
        '/mainscreen/game_details_widget': (context) {
          final arguments = ModalRoute.of(context)?.settings.arguments;
          if (arguments is int) {
            return GameDetailsWidget(gamesId: arguments);
          } else {
            return NoSuchGame();
          }
        },
      },
    );
  }
}
