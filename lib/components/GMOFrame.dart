import 'package:flutter/material.dart';

class GMOFrame extends StatelessWidget {
  final String title;
  final Widget child;
  final Function action;


  GMOFrame({Key key, this.title, this.child, this.action}): super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: Center(
        child: Center(
          child: this.child,
        ),
      ),
      floatingActionButton: ButtonBar(
        children: <Widget>[
          RaisedButton(
            onPressed: this.action,
            child: Row(
              children: <Widget>[
                Icon(Icons.save),
                Text("Save"),
              ],
            ),
          )
        ],
      ),
    );
  }
}
