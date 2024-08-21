import 'package:flutter/material.dart';
import '../responsive_widget.dart';
import '../size_config.dart';
import '../strings.dart';
import '../styling.dart';
import 'exaPage.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.appBackgroundColor,
      body: SafeArea(
        bottom: false,
        left: true,
        right: true,
        top: false,
        child: SingleChildScrollView(
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 2.0 * SizeConfig.widthMultiplier,
                          vertical: 1 * SizeConfig.heightMultiplier,
                        ),
                        child: Text(
                          Strings.food,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: <Widget>[
                              PortraitCard(
                                imagePath: Images.fruit,
                                cardName: Strings.fruit,
                                numberOfCards: "19",
                              ),
                              PortraitCard(
                                imagePath: Images.vegetable,
                                cardName: Strings.vegetable,
                                numberOfCards: "18",
                              ),
                              PortraitCard(
                                imagePath: Images.pizza,
                                cardName: Strings.pizza,
                                numberOfCards: "12",
                              ),
                              PortraitCard(
                                imagePath: Images.burger,
                                cardName: Strings.burger,
                                numberOfCards: "7",
                              ),
                              PortraitCard(
                                imagePath: Images.donut,
                                cardName: Strings.donut,
                                numberOfCards: "7",
                              ),
                              PortraitCard(
                                imagePath: Images.sweet,
                                cardName: Strings.sweet,
                                numberOfCards: "16",
                              ),
                              PortraitCard(
                                imagePath: Images.cake,
                                cardName: Strings.cake,
                                numberOfCards: "12",
                              ),
                              PortraitCard(
                                imagePath: Images.icecream,
                                cardName: Strings.icecream,
                                numberOfCards: "9",
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 2.0 * SizeConfig.widthMultiplier,
                          vertical: 1 * SizeConfig.heightMultiplier,
                        ),
                        child: Text(
                          Strings.drink,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: <Widget>[
                              PortraitCard(
                                imagePath: Images.coke,
                                cardName: Strings.coke,
                                numberOfCards: "11",
                              ),
                              PortraitCard(
                                imagePath: Images.juice,
                                cardName: Strings.juice,
                                numberOfCards: "22",
                              ),
                              PortraitCard(
                                imagePath: Images.beer,
                                cardName: Strings.beer,
                                numberOfCards: "8",
                              ),
                              PortraitCard(
                                imagePath: Images.coffee,
                                cardName: Strings.coffee,
                                numberOfCards: "7",
                              ),
                              PortraitCard(
                                imagePath: Images.yoghurt,
                                cardName: Strings.yoghurt,
                                numberOfCards: "17",
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )),

      ),
    );
  }
}

class CountryCard extends StatelessWidget {
  final String startLetter;

  const CountryCard({required this.startLetter});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: 20,
      margin: EdgeInsets.only(bottom: 20,left: 10),
      color: Colors.white,
      child: Text(startLetter,style: TextStyle(fontSize: 10),),
    );
  }
}


class PortraitCard extends StatelessWidget {
  final String imagePath, cardName, numberOfCards;

  const PortraitCard({required this.imagePath, required this.cardName, required this.numberOfCards});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: displayWidth(context)*0.35,
      margin: EdgeInsets.symmetric(horizontal: 3 * SizeConfig.widthMultiplier),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(3 * SizeConfig.heightMultiplier),
        ),
      ),
      child: InkWell(
        onTap: (){
          Navigator.of(context)
              .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
            return exaPage(value: cardName,);
          }));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 12,
              child: ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(3 * SizeConfig.heightMultiplier),
                ),
                child: AspectRatio(
                  aspectRatio: 0.6,
                  child: Image.asset(imagePath,color: Colors.black,height: 20,)
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(3.0 * SizeConfig.widthMultiplier),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    cardName,
                    style: Theme.of(context).textTheme.titleLarge
                  ),
                  Text(
                    "$numberOfCards $cardName\s",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TopContainerPortrait extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.9,
      alignment: Alignment.topCenter,
      child: Container(
        padding: EdgeInsets.only(top: 2.0 * SizeConfig.heightMultiplier),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.vertical(
            bottom: Radius.circular(24.0),
          ),
          color: AppTheme.topBarBackgroundColor,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.all(2 * SizeConfig.heightMultiplier),
                width: double.maxFinite,
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Center(
                        child: Text(
                          Strings.Title,
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
