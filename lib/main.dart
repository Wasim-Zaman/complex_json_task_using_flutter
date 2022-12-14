import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/home_page.dart';

import 'models/data_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DataModel(),
      child: MaterialApp(
        title: 'Complex Json',
        home: HomePage(),
        darkTheme: ThemeData.dark(),
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
          accentColor: Colors.amber,
        ),
      ),
    );
  }
}
