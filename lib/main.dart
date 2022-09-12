import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tech_blog/component/my_colors.dart';
import 'package:tech_blog/view/register/registerInto.dart';
import 'package:tech_blog/view/splash_screen.dart';



void main() {
  runApp(MainPage());
}

class MainPage extends StatefulWidget {

  const MainPage({
    Key? key,
  }) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();

}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      // ignore: prefer_const_literals_to_create_immutables
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('fa', ''), // farsi, no country code
      ],
      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style:ButtonStyle(backgroundColor:
          MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return SolidColors.seeMore;
            }
            return SolidColors.primeryColor;
          })),
        ),
        fontFamily: 'IranSans',
        textTheme: const TextTheme(

          headline1: TextStyle(
            fontFamily: 'IranSans',
            fontWeight: FontWeight.w700,
            fontSize: 14,
          ),
          headline2: TextStyle(
            fontFamily: 'IranSans',
            fontWeight: FontWeight.w700,
            fontSize: 14,
            color: Color.fromRGBO(190, 21, 9, 1),
          ),
          headline3: TextStyle(
            fontFamily: 'IranSans',
            fontWeight: FontWeight.w700,
            fontSize: 14,
            color: Colors.green,
          ),

        ),
      ),

      debugShowCheckedModeBanner: false,
      home: splashScreen(),

    );
  }
}

