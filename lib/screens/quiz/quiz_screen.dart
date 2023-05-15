import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:quiz_app/button.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/screens/quiz/components/body.dart';

import '../../controller/question_controller.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  QuestionController _controller = Get.put(QuestionController());

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        // Fluttter show the back button automatically
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          FloatingActionButton(
            backgroundColor: Colors.redAccent,
            onPressed:  _controller.nextQuestion,
          child: Text('Skip',
          style: TextStyle(
            color: kDefaultIconLightColor
          ),),)
        ],
      ),
      body : Body(),
    );
  }
}
