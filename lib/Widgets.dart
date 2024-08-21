import 'package:burnitout2/size_config.dart';
import 'package:flutter/material.dart';


class Card_detail extends StatelessWidget {
  final String Lable;

  Card_detail({required this.Lable});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          Lable,
          style: TextStyle(color: Colors.black, fontSize: 0.05*displaySize(context).width),
        )
      ],
    );
  }
}

class Card_bmi extends StatelessWidget {
  final Color Card_color;
  final Widget Card_child;
  final VoidCallback Onpressed;

  Card_bmi({required this.Card_color, required this.Card_child, required this.Onpressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: Onpressed,
      child: Container(
        height: displaySize(context).height*0.2,
        child: Card_child,
        margin: EdgeInsets.all(displaySize(context).width*0.0082),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(15.0)),
      ),
    );
  }
}

class Type_bmi extends StatelessWidget {
  final Color Card_color;
  final Widget Card_child;
  final VoidCallback Onpressed;

  Type_bmi({required this.Card_color, required this.Card_child, required this.Onpressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: Onpressed,
      child: Container(
        height: displaySize(context).height*0.120,
        child: Card_child,
        margin: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
            color: Card_color, borderRadius: BorderRadius.circular(15.0)),
      ),
    );
  }
}