import 'package:flutter/widgets.dart';
import 'package:flutter_app_test/widget_factory.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return widgetFactory.button(child: Text("Hello"),);
  }
}

