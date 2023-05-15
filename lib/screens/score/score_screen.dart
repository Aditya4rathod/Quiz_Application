import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/constants.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quiz_app/screens/home/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../controller/question_controller.dart';

class ScoreScreen extends StatefulWidget {
  @override
  State<ScoreScreen> createState() => _ScoreScreenState();
}

class _ScoreScreenState extends State<ScoreScreen> {
  QuestionController _qnController = Get.put(QuestionController());

  void pref(int marks , int totalMarks)async{
   SharedPreferences getMarks = await SharedPreferences.getInstance();
   getMarks.setInt('marks', marks);
   getMarks.setInt('TotalMarks', totalMarks);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Spacer(flex: 3),
          Text(
            "Score",
            style: Theme
                .of(context)
                .textTheme
                .headline3
            !
                .copyWith(color: kSecondaryColor),
          ),
          Spacer(),
          Text(
            "${_qnController.correctAns * 10}/${_qnController.questions.length * 10}",
            style: Theme
                .of(context)
                .textTheme
                .headline4!
                .copyWith(color: kSecondaryColor),
          ),
          Spacer(),
          InkWell(
            onTap: (){
              Get.to(() => HomeScreen());
            },

            child: Padding(
              padding: const EdgeInsets.all(13.0),
              child: Container(
                width: double.infinity,
                alignment: Alignment.center,
                padding: EdgeInsets.all(kDefaultPadding * 0.75), // 15
                decoration: BoxDecoration(
                  gradient: kPrimaryGradient,
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                child: Text(
                  "Back to Home",
                  style: Theme.of(context)
                      .textTheme
                      .button
                  !.copyWith(color: Colors.black),
                ),
              ),
            ),
          ),
          Spacer(flex: 3),

        ],
      ),
    );
  }
}