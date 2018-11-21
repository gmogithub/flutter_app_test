import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

//import 'package:flutter_app_test/widget_factory.dart';
import 'package:flutter_app_test/components/GMOFrame.dart';
import 'package:flutter_app_test/views/Page2.dart';

void main() {
//  widgetFactory = MaterialWidgetFactory();
  runApp(MyApp());
}

//class MaterialWidgetFactory implements WidgetFactory {
//  @override
//  Widget button({Widget child}) {
//    return RaisedButton(
//      child: child,
//    );
//  }
//
//}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    if (defaultTargetPlatform == TargetPlatform.android) {}
    return MaterialApp(
      title: 'Flutter Demo',
      routes: {'/test': (context) => Page2()},
      theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
          // counter didn't reset back to zero; the application is not restarted.
          primarySwatch: Colors.blue,
          accentColor: Colors.black38),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug paint" (press "p" in the console where you ran
          // "flutter run", or select "Toggle Debug Paint" from the Flutter tool
          // window in IntelliJ) to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            RaisedButton(
              onPressed: _showFrame,
              child: Text("Frame"),
            ),
            RaisedButton(
              onPressed: _showDialog,
              child: Text("Dialog"),
            ),
            RaisedButton(
              onPressed: _showPage2,
              child: Text("page 2"),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            backgroundColor: Theme.of(context).primaryColor,
            onPressed: _decrementCounter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "decremente",
                    overflow: TextOverflow.clip,
                    softWrap: false,
                  ),
                ),
                Icon(Icons.remove)
              ],
            ),
          ),
          FloatingActionButton(
            heroTag: null,
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _showDialog() {
    showDialog(
      context: context,
      builder: (context) => MyDialog(
            child: Text("test"),
          ),
    );
  }

  void _showPage2() {
    Navigator.pushNamed(context, "/test");
  }

  void _showFrame() {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, _, __) => FrameTest(action: test),
      ),
    );
  }

  void test() {
    print("Test");
    Navigator.maybePop(context);
  }
}

bool checkboxValueA = true;

class FrameTest extends StatefulWidget {
  final VoidCallback action;

  const FrameTest({Key key, this.action}) : super(key: key);

  @override
  FrameTestState createState() {
    return new FrameTestState();
  }
}

class FrameTestState extends State<FrameTest> {
  bool checked = false;

  @override
  Widget build(BuildContext context) {
    return GMOFrame(
      title: 'Test',
      action: this.widget.action,
      child: Column(
        children: <Widget>[
          TextField(),
          TextField(),
          Checkbox(
              value: checked,
              onChanged: (value) {
                setState(() {
                  checked = value;
                });
              })
        ],
      ),
    );
  }
}

class FormDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyDialog(
      child: Expanded(child: TextField()),
    );
  }
}

class MyDialog extends StatelessWidget {
  final Widget child;

  const MyDialog({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Align(
        child: Row(
          children: <Widget>[
            this.child,
            RaisedButton(
              onPressed: () => _close(context),
              child: Text("close"),
            ),
          ],
        ),
      ),
    );
  }

  void _close(BuildContext context) {
    Navigator.pop(context);
  }
}
