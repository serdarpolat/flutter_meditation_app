import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meditaion_app/resources/index.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp],
    );
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.white.withOpacity(0.2),
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PagesState()),
        ChangeNotifierProvider(create: (_) => SeeAllType()),
      ],
      child: MaterialApp(
        title: 'Meditation',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.purple,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: "SF",
        ),
        home: Main(),
      ),
    );
  }
}
