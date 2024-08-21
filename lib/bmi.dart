import 'dart:math';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:holding_gesture/holding_gesture.dart';
import 'package:burnitout2/styling.dart';
import 'package:burnitout2/pages/home_screen.dart';
import 'package:burnitout2/size_config.dart';
import 'package:burnitout2/responsive_widget.dart';

import 'Widgets.dart';

int MMaxHeight= 250;
int MMinHeight= 100;
int USMaxHeight= 99;
int USMinHeight= 39;

double WeightM = 50;
double WeightUS= 110;
int HeightM = 180;
int HeightUS = 71;
int Age = 18;
bool status1 = true;
bool status2 = false;
String status = "Metric";
double _bmi = 0.0;
double _perfect= 0.0;
double _closer= 0.0;


class BmiScreen extends StatefulWidget {
  @override
  _BmiScreenState createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.appBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              constraints:BoxConstraints(maxHeight: 0.20* displayHeight(context)),
              child: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  ResponsiveWidget(
                    portraitLayout: TopContainerPortrait(), landscapeLayout: TopContainerPortrait(),
                  ),
                ],
              ),
            ),
            Container(
              constraints: BoxConstraints(maxHeight: 70 * SizeConfig.heightMultiplier),
              decoration: BoxDecoration(
                color: AppTheme.appBackgroundColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    height: displaySize(context).height *0.08,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            child: Type_bmi(
                              Onpressed: () {
                                setState(() {
                                  status1= true;
                                  status2 = false;
                                  status = "Metric";
                                });
                              },
                              Card_color: status1 == true ? kActiveColor  : kInactiveColor,
                              Card_child: Card_detail(
                                Lable: "Metric units",
                              ),
                            )),
                        Expanded(
                            child: Type_bmi(
                              Onpressed: () {
                                setState(() {
                                  status2= true;
                                  status1 = false;
                                  status = "US";

                                });
                              },
                              Card_child: Card_detail(
                                Lable: "Imperial units",),
                              Card_color: status2 == true ? kActiveColor  : kInactiveColor,
                            ))
                      ],
                    ),
                  ),
                  Expanded(
                      flex: 1,
                      child: Card_bmi(
                        Card_child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'HEIGHT',
                              style: kLabelStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: <Widget>[
                                Text(
                                  status == "Metric" ? HeightM.toString() : HeightUS.toString(),
                                  style: kNumberStyle,
                                ),
                                Text(
                                  status == "Metric" ? "cm" : "inch",
                                  style: kLabelStyle,
                                ),
                              ],
                            ),
                            SliderTheme(
                              data: SliderTheme.of(context).copyWith(
                                  thumbColor: AppTheme.selectedTabBackgroundColor,
                                  overlayColor: AppTheme.appBackgroundColor,
                                  activeTrackColor: Colors.white,
                                  inactiveTrackColor: AppTheme.topBarBackgroundColor,
                                  thumbShape:
                                  RoundSliderThumbShape(enabledThumbRadius: 15.0),
                                  overlayShape:
                                  RoundSliderOverlayShape(overlayRadius: 30.0)),
                              child: Slider(
                                  min: status == "Metric" ? MMinHeight.toDouble() : USMinHeight.toDouble(),
                                  max: status == "Metric" ? MMaxHeight.toDouble() : USMaxHeight.toDouble(),

                                  activeColor: AppTheme.topBarBackgroundColor,
                                  inactiveColor: Colors.black,
                                  value: status == "Metric" ? HeightM.toDouble() : HeightUS.toDouble(),
                                  onChanged: (double value) {
                                    setState(() {
                                      status == "Metric" ? HeightM = value.round() : HeightUS = value.round();
                                    });
                                  }),
                            )
                          ],
                        ),
                        Card_color: AppTheme.topBarBackgroundColor, Onpressed: () {  },
                      )),
                  Expanded(
                    flex: 0,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            child: Card_bmi(
                              Card_child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  RichText(
                                    text: TextSpan(
                                      text: 'WEIGHT',
                                      style: kLabelStyle,
                                      children: <TextSpan>[
                                        TextSpan(text: status == "Metric" ? " (kg)" : " (lbs)", style: kLabelStyle),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.baseline,
                                    textBaseline: TextBaseline.alphabetic,
                                    children: <Widget>[
                                      Text(
                                        status == "Metric" ? WeightM.toStringAsFixed(1) : WeightUS.toStringAsFixed(1),
                                        style:kNumberStyle,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      HoldDetector(
                                        onHold: (){
                                          setState(() {
                                            status == "Metric" ? WeightM = (WeightM + 1) : WeightUS = WeightUS + 2;
                                          });
                                        },
                                        child: RawMaterialButton(
                                          child: Icon(FontAwesomeIcons.plus,size: 0.04*displaySize(context).width,),
                                          onPressed: () {
                                            setState(() {
                                              status == "Metric" ? WeightM = (WeightM + 0.1) : WeightUS = WeightUS + 0.2;
                                            });
                                          },
                                          shape: CircleBorder(),
                                          elevation: 6.0,
                                          fillColor: AppTheme.topBarBackgroundColor,
                                          constraints: BoxConstraints.tightFor(
                                              width: 0.09*displaySize(context).width, height: 0.09*displaySize(context).height),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      HoldDetector(
                                        onHold: (){
                                          setState(() {
                                            status == "Metric" ? WeightM-- : WeightUS = WeightUS - 2;
                                          });
                                        },
                                        child: RawMaterialButton(
                                          child: Icon(FontAwesomeIcons.minus,size: 0.04*displaySize(context).width,),
                                          onPressed: () {
                                            setState(() {
                                              status == "Metric" ? WeightM = WeightM - 0.1 : WeightUS = WeightUS - 0.2;
                                            });
                                          },
                                          shape: CircleBorder(),
                                          elevation: 6.0,
                                          fillColor: AppTheme.topBarBackgroundColor,
                                          constraints: BoxConstraints.tightFor(
                                              width: 0.09*displaySize(context).width, height: 0.09*displaySize(context).height),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              Card_color: AppTheme.topBarBackgroundColor, Onpressed: () {  },
                            )),
                        Expanded(
                            child: Card_bmi(
                              Card_child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    'AGE',
                                    style: kLabelStyle,
                                  ),
                                  Text(
                                    Age.toString(),
                                    style: kNumberStyle,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      RawMaterialButton(
                                        child: Icon(FontAwesomeIcons.plus,size: 0.04*displaySize(context).width,),
                                        onPressed: () {
                                          setState(() {
                                            Age++;
                                          });
                                        },
                                        shape: CircleBorder(),
                                        elevation: 6.0,
                                        fillColor: AppTheme.topBarBackgroundColor,
                                        constraints: BoxConstraints.tightFor(
                                            width: 0.09*displaySize(context).width, height: 0.09*displaySize(context).height),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      RawMaterialButton(
                                        child: Icon(FontAwesomeIcons.minus,size: 0.04*displaySize(context).width,),
                                        onPressed: () {
                                          setState(() {
                                            Age--;
                                          });
                                        },
                                        shape: CircleBorder(),
                                        elevation: 6.0,
                                        fillColor: AppTheme.topBarBackgroundColor,
                                        constraints: BoxConstraints.tightFor(
                                            width: 0.09*displaySize(context).width, height: 0.09*displaySize(context).height),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              Card_color:  AppTheme.topBarBackgroundColor, Onpressed: () {  },
                            )),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      showDialog(context: context,
                          builder: (_)=> CustDial(height: status == "Metric" ? HeightM : HeightUS,weigth: status == "Metric" ? WeightM : WeightUS)
                      ); },
                    child: Container(
                      child: Center(
                        child: Text(
                          'CALCULATE',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25,color: Colors.black),
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color:  AppTheme.topBarBackgroundColor,

                      ),
                      height: displaySize(context).height *0.05,
                      margin: EdgeInsets.all(10.0),
                    ),
                  ),
                  Expanded(
                    flex: 0,
                    child: Container(
                      padding: EdgeInsets.only(left: 10,right: 10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Container(color:Colors.yellow,child: Center(child: Column(
                                children: <Widget>[
                                  Text("<18.5",style: TextStyle(fontSize: displaySize(context).width*0.04,fontFamily: "Dosis",color: Colors.black),),
                                  Text("Underweight",style: TextStyle(fontSize: displaySize(context).width*0.03,fontFamily: "Dosis",color: Colors.black))
                                ],
                              ))),
                            ),
                            Expanded(
                              child: Container(color:Colors.green,child: Center(child: Column(
                                children: <Widget>[
                                  Text("18.5 - 25",style: TextStyle(fontSize: displaySize(context).width*0.04,fontFamily: "Dosis",color: Colors.black)),
                                  Text("Normal",style: TextStyle(fontSize: displaySize(context).width*0.03,fontFamily: "Dosis",color: Colors.black))
                                ],
                              ))),
                            ),
                            Expanded(
                              child: Container(color:Colors.orange,child: Center(child: Column(
                                children: <Widget>[
                                  Text("25 - 30",style: TextStyle(fontSize: displaySize(context).width*0.04,fontFamily: "Dosis",color: Colors.black)),
                                  Text("Overweight",style: TextStyle(fontSize: displaySize(context).width*0.03,fontFamily: "Dosis",color: Colors.black))
                                ],
                              ))),
                            ),
                            Expanded(
                              child: Container(color:Colors.red,child: Center(child: Column(
                                children: <Widget>[
                                  Text("30>",style: TextStyle(fontSize: displaySize(context).width*0.04,fontFamily: "Dosis",color: Colors.black)),
                                  Text("Obesity",style: TextStyle(fontSize: displaySize(context).width*0.03,fontFamily: "Dosis",color: Colors.black))
                                ],
                              ))),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustDial extends StatefulWidget {
  final int height;
  final double weigth;

  const CustDial({required this.height, required this.weigth});
  @override
  _CustDialState createState() => _CustDialState(height: height,weigth: weigth);
}

class _CustDialState extends State<CustDial> {
  final int height;
  final double weigth;

  _CustDialState({
    required this.weigth,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppTheme.topBarBackgroundColor,
      title: RichText(
        text: TextSpan(
          text: 'Your BMI is ',
          style: TextStyle(fontWeight: FontWeight.bold,
              fontSize: displaySize(context).width * 0.07,
              fontFamily: "Dosis",
              color: getColor()),
          children: <TextSpan>[
            TextSpan(text: status == "Metric" ? getBMImetric() : getBMIus(),
                style: TextStyle(fontWeight: FontWeight.bold,
                    fontSize: displaySize(context).width * 0.1,
                    fontFamily: "Dosis")),
          ],
        ),
      ),
      content: Text(getInterpretation(), style: TextStyle(
          fontSize: displaySize(context).width * 0.07,
          fontFamily: "Dosis",
          fontWeight: FontWeight.bold,color: Colors.black,),),
      actions: <Widget>[
        TextButton(child: Text("Okay", style: TextStyle(color: Colors.black),),
          onPressed: () {
            Navigator.of(context).pop();
          },),
      ],
      elevation: 24.0,
    );
  }

  String getBMImetric() {
    _bmi = weigth / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getBMIus() {
    _bmi = (weigth / pow(height, 2)) * 703;
    return _bmi.toStringAsFixed(1);
  }

  String getInterpretation() {
    if (status == "Metric" ? (double.parse(getBMImetric()) > 30 || double.parse(getBMImetric()) ==30):(double.parse(getBMIus()) > 30 || double.parse(getBMIus()) ==30))
      return 'Ohh No! You are currently obese. TIPS! Avoid eating food with high calories (junk food) or consult a doctor immediately !!';
    else if (status == "Metric" ? (double.parse(getBMImetric()) >= 25.01 && (double.parse(getBMImetric()) <= 30)): (double.parse(getBMIus()) >= 25.01 && (double.parse(getBMIus()) <= 30)))
      return 'Ahh! You are currently overweighted. Try to exercise more and eat more healthier food.';
    else if (status == "Metric" ?(double.parse(getBMImetric()) >= 18.5 && (double.parse(getBMImetric()) <= 25)) : ((double.parse(getBMImetric()) >= 18.5 && (double.parse(getBMImetric()) <= 25))))
      return 'WOW! You have a perfect weight. What is your secret ? 😉.';
    else
      return 'Ohh! You are currently underweighted. Try to eat more and live a healthy life.';
  }

  Color getColor() {
    if (status == "Metric" ? (double.parse(getBMImetric()) > 30 || double.parse(getBMImetric()) ==30):(double.parse(getBMIus()) > 30 || double.parse(getBMIus()) ==30))
      return Colors.red;
    else if (status == "Metric" ? (double.parse(getBMImetric()) >= 25.01 && (double.parse(getBMImetric()) <= 30)): (double.parse(getBMIus()) >= 25.01 && (double.parse(getBMIus()) <= 30)))
      return Colors.orange;
    else if (status == "Metric" ?(double.parse(getBMImetric()) >= 18.5 && (double.parse(getBMImetric()) <= 25)) : ((double.parse(getBMImetric()) >= 18.5 && (double.parse(getBMImetric()) <= 25))))
      return Colors.green;
    else
      return Colors.yellow;
  }
}

class PerfectDialog extends StatelessWidget {
  final int height;
  final double bmi;
  final double weight;

  PerfectDialog({
    required this.bmi,
    required this.weight,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      title: bmi < 18.5 || bmi>25 ? Text("You need to:",style: TextStyle(fontSize: displaySize(context).width*0.06,fontFamily: "Dosis"),): Text(""),
      content: bmi < 18.5 || bmi>25 ? Text("${status=="Metric" ? getPerfectM() : getPerfectUS()}",style: TextStyle(fontSize: displaySize(context).width*0.05,fontFamily: "Dosis",fontWeight: FontWeight.bold),) : Text("You have already a perfect BMI",style: TextStyle(fontSize: displaySize(context).width*0.07,fontFamily: "Dosis",fontWeight: FontWeight.bold),),
      actions: <Widget>[
        TextButton(child: Text("Okay",style: TextStyle(color: Colors.black),),
          onPressed: () {
            Navigator.of(context).pop();
          },),
      ],
      elevation: 24.0,
    );
  }


  String getPerfectM() {
    if(21.0 < bmi){
      _closer = 24.9;
    }else if(21.0 >bmi){
      _closer = 18.5;
    }else{
      _closer = 21.7;
    }
    _perfect = 21.0*pow(height / 100, 2);
    if(_perfect < weight){
      _perfect = weight -_perfect;
      _closer = _closer*pow(height/100,2);
      _closer = weight -_closer;
      return "Lose ${_perfect.toStringAsFixed(1)}kg to get perfect BMI or atleast lose ${_closer.toStringAsFixed(1)}kg";
    }else{
      _perfect = _perfect -weight ;
      _closer = _closer*pow(height/100,2);
      _closer = _closer -weight;
      return "Gain ${_perfect.toStringAsFixed(1)}kg to get perfect BMI or atleast gain ${_closer.toStringAsFixed(1)}kg";
    } }

  String getPerfectUS() {
    if(21.0 < bmi){
      _closer = 24.9;
    }else if(21.0 >bmi){
      _closer = 18.5;
    }else{
      _closer = 21.7;
    }
    _perfect = (21.0*pow(height, 2))/703;
    if(_perfect < weight){
      _perfect = weight -_perfect;
      _closer = (_closer*pow(height,2))/703;
      _closer = weight -_closer;
      return "Lose ${_perfect.toStringAsFixed(1)}lbs to get perfect BMI or atleast lose ${_closer.toStringAsFixed(1)}lbs";
    }else{
      _perfect = _perfect -weight ;
      _closer = (_closer*pow(height,2))/703;
      _closer = _closer -weight;
      return "Gain ${_perfect.toStringAsFixed(1)}lbs to get perfect BMI or atleast gain ${_closer.toStringAsFixed(1)}lbs";
    }
  }

}