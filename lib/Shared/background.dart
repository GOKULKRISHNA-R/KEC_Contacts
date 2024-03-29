import 'package:flutter/material.dart';


class Background extends StatelessWidget {
  final Widget child;
  const Background({super.key, 
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: Colors.white,
      height: double.infinity,
      width: double.infinity,
      // Here i can use size.width but use double.infinity because both work as a same
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
              "Assets/Images/main_top.png",
              width: size.width * 0.35,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Image.asset(
              "Assets/Images/main_bottom.png",
              width: size.width * 0.25,
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset(
              "Assets/Images/login_bottom.png",
              width: size.width * 0.4,
            ),
          ),

          child,
        ],
      ),
    );
  }
}