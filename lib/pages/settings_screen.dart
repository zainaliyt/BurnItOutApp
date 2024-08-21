import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Widgets.dart';
import '../responsive_widget.dart';
import '../size_config.dart';
import '../styling.dart';
import 'home_screen.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.appBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              constraints: BoxConstraints(
                maxHeight: 0.20 * displayHeight(context),
              ),
              child: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  ResponsiveWidget(
                    portraitLayout: TopContainerPortrait(),
                    landscapeLayout: TopContainerPortrait(),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 20),
              constraints: BoxConstraints(
                maxHeight: 0.70 * displayHeight(context),
              ),
              decoration: BoxDecoration(
                color: AppTheme.appBackgroundColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Card_bmi(
                      Card_child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: <Widget>[
                              Text(
                                "BurnItOut",
                                style: kNumberStyle,
                              ),
                            ],
                          ),
                          Text(
                            'Created 2020',
                            style: kLabelStyle,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text(
                              'Is a place for food lovers and for people who care about their health',
                              style: kLabelStyle,
                            ),
                          ),
                          Expanded(
                            flex: 0,
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: 12,
                                right: 12,
                                top: displaySize(context).width * 0.05,
                              ),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Container(
                                      width: displaySize(context).width * 0.2,
                                      height: displaySize(context).height * 0.05,
                                      decoration: BoxDecoration(
                                        color: AppTheme.appBackgroundColor,
                                        borderRadius: BorderRadius.circular(6),
                                        border: Border.all(
                                          width: 2,
                                          color: AppTheme.topBarBackgroundColor,
                                        ),
                                      ),
                                      child: MaterialButton(
                                        splashColor: AppTheme.topBarBackgroundColor,
                                        child: Text(
                                          "More by Developer",
                                          style: TextStyle(
                                            fontSize: displaySize(context).width * 0.030,
                                          ),
                                        ),
                                        onPressed: () {
                                          launch("https://play.google.com/store/apps/dev?id=7828653527322408285");
                                        },
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: displaySize(context).width * 0.02),
                                  Expanded(
                                    flex: 0,
                                    child: Container(
                                      width: displaySize(context).width * 0.22,
                                      height: displaySize(context).height * 0.05,
                                      decoration: BoxDecoration(
                                        color: AppTheme.appBackgroundColor,
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                          width: 2,
                                          color: AppTheme.topBarBackgroundColor,
                                        ),
                                      ),
                                      child: MaterialButton(
                                        splashColor: AppTheme.topBarBackgroundColor,
                                        child: Text(
                                          "Share",
                                          style: TextStyle(
                                            fontSize: displaySize(context).width * 0.030,
                                          ),
                                        ),
                                        onPressed: () {
                                          Share.share(
                                            'Check Out BurnItOut https://play.google.com/store/apps/details?id=com.zencom.burnitout',
                                            subject: 'Try Out This App!',
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Card_color: AppTheme.appBackgroundColor,
                      Onpressed: () {},
                    ),
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
