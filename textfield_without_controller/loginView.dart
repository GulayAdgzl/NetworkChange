import 'package:flutter/material.dart';

import 'clear_action.dart';
//Action metodu ile clear metodu dışında başka metod kullanmasına izin vermemek controllerin

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> with LoginController {
  String _value = '';
  late final ControllerCleaner _controllerCleaner;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    textaction = ClearTextAction();
    _controllerCleaner = ControllerCleaner(textaction);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Row(
        children: [
          FloatingActionButton.large(
              //Basıldığında home yazsın
              onPressed: () {
                _controllerCleaner.update('Home');
              },
              child: Icon(Icons.home)),
          FloatingActionButton(
            onPressed: () {
              //_controller.clear();
              //textaction.invoke(ClearTextIntent(_value));
              _controllerCleaner.clear();
            },
          ),
        ],
      ),
      body: TextFieldCustom(
        //controller: _controller,
        action: textaction,
        onChange: (String value) {
          _value = value;
        },
      ),
    );
  }
}

class TextFieldCustom extends StatelessWidget {
  TextFieldCustom({
    Key? key,
    //required this.controller,
    required this.action,
    required this.onChange,
  }) : super(key: key);
  final TextEditingController controller = TextEditingController();
  final ClearTextAction action;
  final void Function(String value) onChange;

  @override
  Widget build(BuildContext context) {
    return ActionListener(
      action: action,
      listener: (action) {
        if (action is ClearTextAction) {
          //print(action.text);
          //controller.clear();
          if (action.text.isEmpty) {
            controller.clear();
          } else {
            controller.text = action.text;
          }
        }
      },
      child: TextField(
        onChanged: onChange,
        //controller: controller,
      ),
    );
  }
}

mixin LoginController on State<LoginView> {
  final TextEditingController _controller = TextEditingController();
  late final ClearTextAction textaction;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
    textaction = ClearTextAction();
  }
}

class ControllerCleaner {
  final ClearTextAction _clearTextAction;

  ControllerCleaner(ClearTextAction clearTextAction)
      : _clearTextAction = clearTextAction;

  void clear() {
    _clearTextAction.invoke(ClearTextIntent());
  }

  void update(String title) {
    _clearTextAction.invoke(ClearTextIntent(text: title));
  }
}
