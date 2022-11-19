import 'package:flutter/material.dart';

import 'network_change_manager.dart';

class NoNetworkWidget extends StatefulWidget {
  const NoNetworkWidget({super.key});

  @override
  State<NoNetworkWidget> createState() => _NoNetworkWidgetState();
}

class _NoNetworkWidgetState extends State<NoNetworkWidget> with StateMixin {
  late final INetworkChangeManager _networkChangeManager;
  NetworkResult? _networkResult;
  @override
  void initState() {
    super.initState();
    _networkChangeManager = NetworkChangeManager();
    fetchFirstResult();
    _networkChangeManager.handleNetworkChange((result) {
      updateView(result);
    });
  }

  Future<void> fetchFirstResult() async {
    //Ekranın draw ı bittikten sonra call olmasını istersek
    
    waitForScreen(
      () {
        _networkChangeManager.handleNetworkChange((result) {
          updateView(result);
        });
      },
    );
  }

  void updateView(NetworkResult result) {
    setState(() {
      _networkResult = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
        firstChild: Container(height: 50, color: Colors.black),
        secondChild: SizedBox(),
        crossFadeState: _networkResult == NetworkResult.off
            ? CrossFadeState.showFirst
            : CrossFadeState.showSecond,
        duration: Duration(seconds: 10));
  }
}

mixin StateMixin<T extends StatefulWidget> on State<T> {
  void waitForScreen(VoidCallback onComplete) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      onComplete.call();
    });
  }
}
