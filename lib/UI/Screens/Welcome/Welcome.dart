import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:page_transition/page_transition.dart';
import 'package:social/UI/Screens/Login/login.dart';
import 'package:social/UI/Screens/Sign/Sign.dart';
import 'package:social/UI/Widgets/Button.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: size.height * .09,
            ),
            Text(
              'Welcome',
              style: Theme.of(context).textTheme.headline4.copyWith(
                fontSize: size.width * .07,
              ),
            ),
            SizedBox(
              height: size.height * .07,
            ),
            Image.asset(
              'assets/images/welcome.jpg',
              width: size.width * .85,
            ),
            SizedBox(
              height: size.height * .06,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                ''
                    'The best Social App to communicate with the world and make new friends easily ',
                style: Theme.of(context).textTheme.bodyText1.copyWith(
                    fontFamily: 'Bir',
                    fontWeight: FontWeight.w500,
                    fontSize: size.width * .043),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: size.height * .08,
            ),
            Button(
              text: 'Login',
              fun: () {
                Navigator.push(
                    context,
                    PageTransition(
                        child: Login(),
                        type: PageTransitionType.scale,
                        duration: Duration(milliseconds: 700),
                        alignment: Alignment.bottomCenter,
                        childCurrent: this));
              },
              colur: Colors.grey[200],
              textColor: Colors.black,
              colorbool: false,
            ),
            SizedBox(
              height: size.height * .025,
            ),
            Button(
              colorbool: true,
              text: 'SignUp',
              textColor: Colors.white,
              fun: () {
                Navigator.push(
                    context,
                    PageTransition(
                        child: Sign(),
                        type: PageTransitionType.scale,
                        duration: Duration(milliseconds: 700),
                        alignment: Alignment.bottomCenter,
                        childCurrent: this));
              },
            ),
          ],
        ),
      ),
    );
  }
}
