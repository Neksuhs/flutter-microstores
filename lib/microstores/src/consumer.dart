import 'package:flutter/widgets.dart';

import 'controller.dart';
import 'microstoresprovider.dart';

typedef BuilderCallback = Widget Function(
  BuildContext context,
  Controller controller,
);

class Consumer extends StatefulWidget {
  final BuilderCallback builder;
  // final bool listen;
  final List<String> microstores;

  const Consumer({
    Key? key,
    required this.builder,
    // required this.listen,
    required this.microstores,
  }) : super(key: key);

  @override
  _ConsumerState createState() => _ConsumerState();
}

class _ConsumerState extends State<Consumer> {
  // init state so didChangeDependencies is called
  @override
  void initState() {
    super.initState();
  }

  // get the controller and microstores based on the list of keys and
  // listen for changes
  @override
  void didChangeDependencies() {
    final MicrostoresProviderState? provider =
        context.findAncestorStateOfType<MicrostoresProviderState>();
    final microstores = provider!.controller.these(widget.microstores);
    for (var i = 0; i < widget.microstores.length; i++) {
      microstores[i]!.listen(_setState);
    }
    super.didChangeDependencies();
  }

  // get the controller and microstores based on the list of keys and
  // and unlisten
  @override
  void dispose() {
    final MicrostoresProviderState? provider =
        context.findAncestorStateOfType<MicrostoresProviderState>();
    final microstores = provider!.controller.these(widget.microstores);
    for (var i = 0; i < widget.microstores.length; i++) {
      microstores[i]!.unListen(_setState);
    }
    super.dispose();
  }

  // _setState is passed to microstore.listen so that reads can call setState
  void _setState() {
    setState(() {
      return;
    });
  }

  // execute builder, returning the controller so that the widget can read
  // a specific microstore by id
  @override
  Widget build(BuildContext context) {
    final MicrostoresProviderState? provider =
        context.findAncestorStateOfType<MicrostoresProviderState>();
    return widget.builder(context, provider!.controller);
  }
}
