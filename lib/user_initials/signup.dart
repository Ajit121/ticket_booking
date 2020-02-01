import 'package:flutter/material.dart';

import 'package:ticket_booking/theme/AppDecoration.dart';
import 'package:ticket_booking/theme/TextLabel.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Text(
                    'Fisrt name',
                    style: labelStyle,
                  ),
                ),
                SizedBox(width: 20,),
                Expanded(
                  flex: 1,
                  child: Text(
                    'Last name',
                    style: labelStyle,
                  ),
                ),
              ],
            ),
            SizedBox(height: 5,),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: TextFormField(
                    decoration: InputDecoration(hintText: 'Enter first name'),
                  ),
                ),
                SizedBox(width: 20,),
                Expanded(
                  flex: 1,
                  child: TextFormField(
                    decoration: InputDecoration(hintText: 'Enter last name'),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20,),
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
            Text('Mobile number'),
            Padding(
              padding: const EdgeInsets.only(top: 5,bottom: 20),
              child: Row(children: <Widget>[
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(hintText: '+91'),
                  ),
                ),
                SizedBox(width: 20,),
                Expanded(
                  flex: 3,
                  child: TextFormField(
                    decoration: InputDecoration(hintText: 'Enter mobile number'),
                  ),
                ),

              ],),
            ),
            Text(
              'Email',
              style: labelStyle,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 20),
              child: TextFormField(
                decoration: InputDecoration(hintText: 'Enter email'),
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
            SizedBox(
              height: 30,
            ),
            Container(
              width: double.infinity,
              child: RaisedButton(
                onPressed: () {},
                child: Text('Sign Up'),
              ),
            )
          ],
        ),
      ),
    );
  }


}
