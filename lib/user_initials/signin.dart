import 'package:flutter/material.dart';
import 'package:ticket_booking/home.dart';
import 'package:ticket_booking/theme/AppDecoration.dart';
import 'package:ticket_booking/theme/TextLabel.dart';

class SignInPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SignPageState();
}

class _SignPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: cardDecoration,
      margin: const EdgeInsets.all(20),
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            Text(
              'Username',
              style: labelStyle,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 20),
              child: TextFormField(
                decoration: InputDecoration(hintText: 'Enter username'),
              ),
            ),
            Text(
              'Password',
              style: labelStyle,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 20),
              child: TextFormField(
                decoration: InputDecoration(hintText: 'Enter password'),
                obscureText: true,
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text('Forgot Password?'),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: double.infinity,
              child: RaisedButton(
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => HomePage()),
                      (route) => false);
                },
                child: Text('Sign in'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
