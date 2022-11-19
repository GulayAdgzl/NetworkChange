import 'package:flutter/material.dart';

class NetworkChangeView extends StatefulWidget {
  const NetworkChangeView({super.key});

  @override
  State<NetworkChangeView> createState() => _NetworkChangeViewState();
}

class _NetworkChangeViewState extends State<NetworkChangeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Placeholder(),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.abc), label: "Page1"),
          BottomNavigationBarItem(icon: Icon(Icons.abc), label: "Page2")
        ],
      ),
    );
  }
}
