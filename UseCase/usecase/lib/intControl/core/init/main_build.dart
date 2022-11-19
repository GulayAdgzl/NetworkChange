import 'package:flutter/cupertino.dart';

import '../../no_network_widget.dart';

class MainBuild{
  //singelton olması için-birinin türememesi için
  //MainBuild()._();
 
 
  static Widget build(BuildContext context,Widget? child){
    return  Column(
          children: [
            Expanded(child: child ?? SizedBox()),
            const NoNetworkWidget(),
          ],
        );
  }
}
