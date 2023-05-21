import 'package:flutter/material.dart';

import 'package:wrapperekrangecis/models/todo.dart';
import 'package:wrapperekrangecis/screen/todolistmodel.dart';
import 'package:wrapperekrangecis/utils/mydrawer.dart';

class TodoDetail extends StatefulWidget {
  final Todo todo;
  const TodoDetail({required this.todo, super.key});

  @override
  State<TodoDetail> createState() => _TodoDetailState();
}

class _TodoDetailState extends State<TodoDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Mydrawer(),
      appBar: AppBar(
        title: Text("${widget.todo.title} Detay"),
        actions: [
          Checkbox(
              activeColor: Colors.blue,
              onChanged: (newValue) {},
              value: widget.todo.isCompleted),
          Icon(
            Icons.star,
            color: widget.todo.isStar! ? Colors.amber : Colors.black45,
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: Center(
        child: Text(widget.todo.title),
      ),
    );
  }
}
