import 'package:flutter/widgets.dart';

import 'controller.dart';

// MicrostoresProvider makes a Controller available to the Consumer widget
class MicrostoresProvider extends StatefulWidget {
  final Widget child;
  final Controller controller;

  const MicrostoresProvider({
    Key? key,
    required this.child,
    required this.controller,
  }) : super(key: key);

  @override
  MicrostoresProviderState createState() => MicrostoresProviderState();
}

class MicrostoresProviderState extends State<MicrostoresProvider> {
  // Return the controller
  Controller get controller => widget.controller;

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
