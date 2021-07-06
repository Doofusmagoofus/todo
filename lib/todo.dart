//The stateful widget for the checkbox for the to-do list
//The entire function of the checkbox

import 'package:flutter/material.dart';

class ToDoListCheckBox extends StatefulWidget {
  const ToDoListCheckBox({Key? key}) : super(key: key);

  @override
  State<ToDoListCheckBox> createState() => CheckBox();
}

//A private class for the ToDoListCheckBox function.
class CheckBox extends State<ToDoListCheckBox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
//Creates a textfield for the user
      title: TextField(),

//Forms the background color of the checkbox line, colors the check,
//and fills the remaining color of the checkbox once checked
      tileColor: Color.fromARGB(35, 0, 0, 0),
      checkColor: Colors.white,
      activeColor: Colors.black,

//Whether the box is checked or not
      value: isChecked,

//Called when the value of the checkbox is changed
      onChanged: (bool? value) {
//Changes the boolean value of the checkbox
        setState(
          () {
            isChecked = value!;
          },
        );
      },
//Positions the checkbox to the left of the line
      controlAffinity: ListTileControlAffinity.leading,
    );
  }
}

// MR SULLIVAN'S CHANGES

// Builder widget, should put this in a seperate file (in a widgets folder)
class TodoListBuilder extends StatefulWidget {
  TodoListBuilder({Key? key}) : super(key: key);

  @override
  _TodoListBuilderState createState() => _TodoListBuilderState();
}

class _TodoListBuilderState extends State<TodoListBuilder> {
  //Create instances of TodoItems
  List<TodoItem> todoList = [
    TodoItem('Item1', false, 'This is content'),
    TodoItem('Item1', false, 'This is content'),
    TodoItem('Item1', false, 'This is content')
  ];

  //Create a function to take the boolean value and change it onChanged in Checkboxlisttile
  void itemChange(bool val, int index) {
    setState(() {
      todoList[index].checked = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: todoList.length,
      itemBuilder: (BuildContext context, int index) {
        return CheckboxListTile(
          title: Text(todoList[index].title),
          value: todoList[index].checked,
          onChanged: (bool? value) {
            //Run function
            itemChange(value!, index);
          },
        );
      },
    );
  }
}

//Object for your todoitem

class TodoItem {
  final String title;
  bool checked;
  final String content;

  TodoItem(this.title, this.checked, this.content);
}
