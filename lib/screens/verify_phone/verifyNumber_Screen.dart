import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/constants.dart';
import 'package:get/get.dart';

import '../home/home_screen.dart';
import '../quiz/quiz_screen.dart';

class VerifyNumber extends StatefulWidget {

  final String verificationId;
  const VerifyNumber({Key? key ,
  required this.verificationId
  }) : super(key: key);

  @override
  State<VerifyNumber> createState() => _VerifyNumberState();
}

class _VerifyNumberState extends State<VerifyNumber> {

  bool loading = false;
  final auth = FirebaseAuth.instance;
  final otpNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:   Padding(
        padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Spacer(flex: 2), //2/6
            Text(
              "Verification,",
              style: Theme.of(context).textTheme.headline4!.copyWith(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Text("Enter Recived OTP  below"),
            Spacer(), // 1/6
            TextFormField(
              controller: otpNumberController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xFF1C2341),
                hintText: "6 digit OTP ",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
              ),
            ),
            Spacer(), // 1/6
            InkWell(
              onTap: ()async{
                final credential = PhoneAuthProvider.credential(
                    verificationId: widget.verificationId,
                    smsCode: otpNumberController.text.toString());
                try{
                 await auth.signInWithCredential(credential);
                 Get.to(() => HomeScreen());
                }catch(e){
                }
              },
              child: Container(
                width: double.infinity,
                alignment: Alignment.center,
                padding: EdgeInsets.all(kDefaultPadding * 0.75), // 15
                decoration: BoxDecoration(
                  gradient: kPrimaryGradient,
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                child: Text(
                  "Submit",
                  style: Theme.of(context)
                      .textTheme
                      .button
                  !.copyWith(color: Colors.black),
                ),
              ),
            ),
            Spacer(flex: 2), // it will take 2/6 spaces
          ],
        ),
      ),
    );
  }
}
