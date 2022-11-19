import 'package:flutter/material.dart';
import 'package:usecase/intControl/no_network_widget.dart';

import 'intControl/core/init/main_build.dart';
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
      builder: MainBuild.build,
      /*(context, child) {
        //Btün widgetler,n ilk çizildiği noktada araya girebiliyoruz.Ekranın önüne bi şeyler yapabiliyoruz
        return Column(
          children: [
            Expanded(child: child ?? SizedBox()),
            const NoNetworkWidget(),
          ],
        );*/
    
      
      
      home: NetworkChangeView(),
    );
  }
}
