import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:ticket_booking/theme/AppDecoration.dart';
import 'package:ticket_booking/theme/Colors.dart';
import 'package:ticket_booking/theme/TextLabel.dart';
import 'package:ticket_booking/user_initials/signin.dart';
import 'package:ticket_booking/user_initials/signup.dart';

class UserInitialPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: UserInitialPageBody()),
    );
  }
}

class UserInitialPageBody extends StatefulWidget {
  @override
  _UserInitialPageBodyState createState() => _UserInitialPageBodyState();
}

const _switchDuration = Duration(milliseconds: 500);

enum Page { SIGN_IN, SIGN_UP }

class _UserInitialPageBodyState extends State<UserInitialPageBody> {
  Page _page = Page.SIGN_IN;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: Column(
        children: <Widget>[
          AnimatedCrossFade(
              crossFadeState: _page == Page.SIGN_IN
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              duration: _switchDuration,
              firstChild: Text(
                'Signin',
                style: appBarTextStyle,
              ),
              secondChild: Text(
                'Signup',
                style: appBarTextStyle,
              ),
              layoutBuilder:
                  (topChild, topChildKey, bottomChild, bottomChildKey) {
                return LayoutBuildeStack(
                    topChild: topChild,
                    topChildKey: topChildKey,
                    bottomChild: bottomChild,
                    bottomChildKey: bottomChildKey);
              }),
          Expanded(
            child: Align(
              alignment: Alignment.topCenter,
              child: AnimatedSwitcher(
                layoutBuilder: defaultLayoutBuilder,
                  duration: _switchDuration,
                  child: _page == Page.SIGN_IN ? SignInPage() : SignUpPage(),
                  transitionBuilder: (child, transition) {
                    return ScaleTransition(
                      scale: transition,
                      child: child,
                    );
                  }),
            ),
          ),

          AnimatedCrossFade(
            duration: _switchDuration,
            crossFadeState: _page == Page.SIGN_IN
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
            firstChild: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text('Don\'t have an account?'),
                InkWell(
                  onTap: () {
                    setState(() {
                      _page = Page.SIGN_UP;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5, right: 5),
                    child: Text(
                      'Signup',
                      style: TextStyle(color: accentColor),
                    ),
                  ),
                ),
              ],
            ),
            secondChild: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text('Already have an account?'),
                InkWell(
                  onTap: () {
                    setState(() {
                      _page = Page.SIGN_IN;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5, right: 5),
                    child: Text(
                      'Signin',
                      style: TextStyle(color: accentColor),
                    ),
                  ),
                ),
              ],
            ),
            layoutBuilder:
                (topChild, topChildKey, bottomChild, bottomChildKey) {
              return LayoutBuildeStack(
                  topChild: topChild,
                  topChildKey: topChildKey,
                  bottomChild: bottomChild,
                  bottomChildKey: bottomChildKey);
            },
          )
        ],
      ),
    );
  }
  static Widget defaultLayoutBuilder(Widget currentChild, List<Widget> previousChildren) {
    List<Widget> children = previousChildren;
    if (currentChild != null)
      children = children.toList()..add(currentChild);
    return Stack(
      children: children,
      alignment: Alignment.topCenter,
    );
  }
}

class LayoutBuildeStack extends StatelessWidget {
  final Widget topChild, bottomChild;
  final Key topChildKey, bottomChildKey;

  const LayoutBuildeStack({
    this.topChild,
    this.topChildKey,
    this.bottomChild,
    this.bottomChildKey,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      overflow: Overflow.visible,
      alignment: Alignment.center,
      children: <Widget>[
        Positioned(
          child: bottomChild,
          key: bottomChildKey,
          top: 0,
        ),
        Positioned(
          key: topChildKey,
          child: topChild,
        )
      ],
    );
  }
}
