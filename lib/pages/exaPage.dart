
import 'package:flutter/material.dart';
import 'dart:convert';
import '../size_config.dart';
import '../styling.dart';

class exaPage extends StatefulWidget {
  final String value;
  exaPage({required this.value});
  @override
  _exaPageState createState() => _exaPageState();
}

class _exaPageState extends State<exaPage> {
  void _showModalSheet(String name, int cal, String type,String calories) {
    showModalBottomSheet(context: context, builder: (builder) {
      return SafeArea(
        top: false,
        bottom: false,
        child: Container(
          height: displaySize(context).height*0.75,
          child: Column(
            children: <Widget>[
              Text(name+" ${(widget.value)=="Pizza"?widget.value:""}",style: TextStyle(
                  fontFamily: "dosis",fontSize: displayWidth(context) * 0.05,color: Colors.black,
              ),),
              Text("${calories}", style: TextStyle(
                  fontFamily: "dosis",fontSize: displayWidth(context) * 0.035,color: Colors.black,),),
              SizedBox(height:displayHeight(context)* 0.01,),
              Text("• Running on a speed of 5 mph will help you 🔥 ≈11 calories per minute."
                  "\n• Cycling on a speed of 14 mph will help you 🔥 ≈10 calories per minute."
                  "\n• Swimming for an hour will help you 🔥 ≈7 calories per minute."
                  "\n• Performing body-weight exercises for an hour will help you 🔥 ≈6 calories per minute.",
                style: TextStyle(fontFamily: "dosis",fontSize: displayWidth(context) * 0.035,fontWeight: FontWeight.w600,color: Colors.black,),),
              Text("*mph = Miles per hour",style: TextStyle(fontFamily: "dosis",fontSize: displayWidth(context) * 0.03, fontStyle: FontStyle.italic,color: Colors.black,),),
              SizedBox(height: displayHeight(context) * 0.022),
              Text("Here is how you can burn ${cal}cal", style: TextStyle(
                fontFamily: "dosis",fontSize: displayWidth(context) * 0.04,color: Colors.black,),),
              SizedBox(height: displayHeight(context) * 0.01),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text("Running",style: TextStyle(fontFamily: "dosis",fontSize: displayWidth(context) * 0.03,color: Colors.black,),),
                      Image.asset("assets/images/running.png",height: 0.055*displayWidth(context)),
                      SizedBox(height: displayHeight(context) * 0.01),
                      Text((cal/11).toStringAsFixed(0)+"min",style: TextStyle(fontFamily: "dosis",fontSize: displayWidth(context) * 0.04,color: Colors.black,),)
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text("Cycling",style: TextStyle(fontFamily: "dosis",fontSize: displayWidth(context) * 0.03,color: Colors.black,),),
                      Image.asset("assets/images/bicycle.png",height: 0.055*displayWidth(context)),
                      SizedBox(height: displayHeight(context) * 0.01),
                      Text((cal/10).toStringAsFixed(0)+"min",style: TextStyle(fontFamily: "dosis",fontSize: displayWidth(context) * 0.04,color: Colors.black,))
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text("Swimming",style: TextStyle(fontFamily: "dosis",fontSize: displayWidth(context) * 0.03,color: Colors.black,),),
                      Image.asset("assets/images/swim.png",height: 0.055*displayWidth(context)),
                      SizedBox(height: displayHeight(context) * 0.01),
                      Text((cal/7).toStringAsFixed(0)+"min",style: TextStyle(fontFamily: "dosis",fontSize: displayWidth(context) * 0.04,color: Colors.black,))
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text("Working out",style: TextStyle(fontFamily: "dosis",fontSize: displayWidth(context) * 0.03,color: Colors.black,),),
                      Image.asset("assets/images/workout.png",height: 0.055*displayWidth(context)),
                      SizedBox(height: displayHeight(context) * 0.01),
                      Text((cal/4).toStringAsFixed(0)+"min",style: TextStyle(fontFamily: "dosis",fontSize: displayWidth(context) * 0.04,color: Colors.black,))
                    ],
                  ),
                ],
              ),
            ],
          ),
          padding: EdgeInsets.all(displayWidth(context) * 0.04),
        ),
      );
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.topBarBackgroundColor,
        title: Text("BurnItOut",style: TextStyle(color: Colors.black),),
        elevation: 2,
        centerTitle: true,
        iconTheme: IconThemeData(
        color: Colors.black, //change your color here
      ),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 5),
        child: FutureBuilder(
          builder: (context, snapshot) {
            var Data = json.decode(snapshot.data.toString());
            return ListView.separated(
              itemCount: Data.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) =>
                  Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                    child: Card(
                      color:AppTheme.topBarBackgroundColor,
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                      child: Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        padding: EdgeInsets.symmetric(
                            horizontal: 8, vertical: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  width: 0.13*displaySize(context).width,
                                  height: 0.13*displaySize(context).width,
                                  padding: EdgeInsets.all(5),
                                  child: Image.asset(
                                      "assets/images/list/${(widget.value.toLowerCase()).replaceAll(" ", "_")}.png", height: 0.08*displaySize(context).width),
                                ),
                                SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(Data[index]['name'], style: TextStyle(
                                        fontSize: 0.04*displaySize(context).width,color: Colors.black,),),
                                    Text(Data[index]['cal'].toString() + "cal",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 17.0,
                                          fontWeight: FontWeight.w400
                                      ),),
                                  ],
                                ),
                              ],
                            ),
                            Container(
                              alignment: Alignment.center,
                              height: 0.13*displaySize(context).width,
                              padding: EdgeInsets.symmetric(horizontal: 0),
                              child: ElevatedButton(

                                onPressed: () {
                                  _showModalSheet(Data[index]['name'],Data[index]['cal'],widget.value.toLowerCase(),Data[index]['calories']);
                                },
                                child: Text("BurnItOut", style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 0.045*displaySize(context).width),),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ), separatorBuilder: (BuildContext context, int index) { return Container();  },
            );
          },
          future: DefaultAssetBundle.of(context).loadString(
             "assets/${(widget.value.toLowerCase()).replaceAll(" ", "_")}s.json"),
        ),
      ),
    );

}
}