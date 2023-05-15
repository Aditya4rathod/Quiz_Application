import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/constants.dart';

class Button extends StatelessWidget {
  const Button({Key? key,
    this.loading = false,
    this.width = 100,
    this.height = 50,
    this.buttonColor = kRedColor,
    this.textColor = kSecondaryColor,
    required this.onpress,
    required this.title,
  }) : super(key: key);

  final bool loading;
  final String title;
  final double height , width;
  final VoidCallback onpress;
  final Color textColor , buttonColor;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: loading ? CircularProgressIndicator(color: kDefaultIconLightColor)
            :
        Center(
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(color: kDefaultIconLightColor),
          ),
        )

    );
  }
}
