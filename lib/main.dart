import 'package:flutter/material.dart';
import 'package:ncov_visual/provider/apiHelper.dart';
import 'package:ncov_visual/pages/initpage.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider<GlobalResponseHelper>(
            create: (context) => GlobalResponseHelper(),
          ),
          ChangeNotifierProvider<CountriesResponseHelper>(
            create: (context) => CountriesResponseHelper(),
          ),
        ],
        child: InitPage(),
      ),
    );
  }
}
