import 'package:burnitout2/home.dart';
import 'package:flutter/services.dart';
import 'package:burnitout2/size_config.dart';
import 'styling.dart';
import 'package:flutter/material.dart';

void main() {
WidgetsFlutterBinding.ensureInitialized();
SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizeConfig().init(constraints, orientation);
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'BurnItOut',
              theme: AppTheme.lightTheme,
              home: Home(),
            );
          },
        );
      },
    );
  }
}
