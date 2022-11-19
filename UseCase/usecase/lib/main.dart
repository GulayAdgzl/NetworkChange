import 'package:flutter/material.dart';

import 'intControl/view/network_change_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      builder: (context, child) {
        //Btün widgetler,n ilk çizildiği noktada araya girebiliyoruz.Ekranın önüne bi şeyler yapabiliyoruz
        return child ?? SizedBox();
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NetworkChangeView(),
    );
  }
}
