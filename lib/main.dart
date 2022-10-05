import 'package:flutter/material.dart';
import 'package:news_app/provider/news_provider.dart';
import 'package:provider/provider.dart';

import 'data_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => NewsProvider()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Homee(),
      ),
    );
  }
}
