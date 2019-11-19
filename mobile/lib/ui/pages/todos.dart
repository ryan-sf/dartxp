import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
// import 'package:mobile_app/ui/widgets/bloc_widgets/widgets.dart';
import 'package:mobile_app/ui/widgets/provider_widgets/widgets.dart';

class TodosPage extends StatelessWidget {
  const TodosPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          Container(
            child: TodoForm(),
          ),
          Expanded(child: TodoList()),
        ],
      ),
    );
  }
}
