import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:quiz_app/screens/verify_phone/verifyNumber_Screen.dart';
import 'package:quiz_app/utils/utils.dart';


class WelcomeScreen extends StatefulWidget {
  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

 bool loading = false;
  final auth = FirebaseAuth.instance;
  final phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
         // Image.asset('assets/images/welcome.jpg', fit: BoxFit.fitHeight,),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacer(flex: 2), //2/6
                  Text(
                    "Let's Get Started",
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  Text("Enter your phone number below"),
                  Spacer(), // 1/6
                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: phoneNumberController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.call),
                      filled: true,
                      fillColor: Color(0xFF1C2341),
                      hintText: " +91 1234567890 ",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                    ),
                  ),
                  Spacer(), // 1/6
                  InkWell(
                    onTap: (){
                      setState(() {
                        loading = true;
                      });
                      auth.verifyPhoneNumber(
                        phoneNumber: phoneNumberController.text,
                          verificationCompleted: (_){
                          setState(() {
                            loading = false;
                          });
                          },
                          verificationFailed: (e){
                         // Utils.toastMessage(e.toString());
                          setState(() {
                            loading = false;
                          });
                          },
                          codeSent: (String verificationId , int? token){
                          Get.to(() => VerifyNumber(
                            verificationId: verificationId,
                          ));
                          setState(() {
                            loading = false;
                          });
                          },
                          codeAutoRetrievalTimeout: (e){
                         // Utils.toastMessage(e.toString());
                          setState(() {
                            loading = false;
                          });
                          });
                    },
                  //  onTap: () => Get.to(QuizScreen()),
                    child: Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(kDefaultPadding * 0.75), // 15
                      decoration: BoxDecoration(
                        gradient: kPrimaryGradient,
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      child: Text(
                        "Continue",
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
          ),
        ],
      ),
    );
  }
}