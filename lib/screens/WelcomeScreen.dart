import 'package:flutter/material.dart';
import 'package:pomodorotimer/components/WelcomeCard.dart';
import 'package:pomodorotimer/screens/TimerScreen.dart';
import 'package:pomodorotimer/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomeScreen extends StatefulWidget {
  static const id = "welcome";

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  int cardNum = 0;
  static const int kTotalCards = 4;
  List cardList = new List(kTotalCards);

  void nextStep() async {
    if (cardNum < (kTotalCards - 1)) {
      setState(() {
        cardNum++;
      });
    } else {
      // Set the local preference to avoid showing the intro every time
      SharedPreferences prefs = await _prefs;
      await prefs.setBool("seenIntro", true);

      // Proceed to the Timer
      Navigator.pushReplacementNamed(context, TimerScreen.id);
    }
  }

  @override
  void initState() {
    super.initState();

    cardList = [
      WelcomeCard(
        headerText: "Assalem alykoum ! ",
        bodyText: "This is Mr Adam, he is here to help you focus on your work or study !",
        actionText: "> Hi Adam !",
        actionFunc: nextStep,
      ),
      WelcomeCard(
        headerText: "Pomodoro..",
        bodyText: "Working in 25 minute chunks helps you focus for longer !",
        actionText: "> Great !",
        actionFunc: nextStep,
      ),
      WelcomeCard(
        headerText: "Regular Breaks..",
        bodyText:
            "5 Minute breaks help with retention and energy. \nIt is recommended you have a small walk in that break !",
        actionText: "> Awesome !",
        actionFunc: nextStep,
      ),
      WelcomeCard(
        headerText: "Settings..",
        bodyText: "Change the default settings by clicking on Adam later.",
        actionText: "> Ok, lets go !",
        actionFunc: nextStep,
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [kBackgroundGradientBegin, kBackgroundGradientEnd])),
        child: SafeArea(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 40.0, horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                cardList[cardNum],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
