import 'package:flutter/material.dart';

class TodoList extends StatefulWidget {
  @override
  TodoListState createState() => new TodoListState();
}

class TodoListState extends State<TodoList> {
  List<String> todos = new List<String>();

  TextEditingController todoCtrl = new TextEditingController();

  void addTodo(text) {
    setState(() {
      todos.add(text);
    });
    todoCtrl.clear();
  }

  void delTodo(index) {
    setState(() {
      todos.removeAt(index);
    });
  }

  Widget _buildTodos() {
    return new ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          return new ListTile(
            leading: new Icon(Icons.check_box_outline_blank),
            title: new Text(todos[index],
                maxLines: 1, overflow: TextOverflow.ellipsis),
            trailing: new InkWell(
                child: Icon(Icons.close), onTap: () => delTodo(index)),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    print(todos);
    return new Container(
      child: new Column(
        children: <Widget>[
          new Card(
            elevation: 4.0,
            child: new Padding(
              padding:
                  new EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: new TextField(
                  controller: todoCtrl,
                  decoration: new InputDecoration(
                      hintText: 'Write something...', border: InputBorder.none),
                  onSubmitted: addTodo),
            ),
          ),
          new Expanded(
            child: _buildTodos(),
          )
        ],
      ),
    );
  }
}
