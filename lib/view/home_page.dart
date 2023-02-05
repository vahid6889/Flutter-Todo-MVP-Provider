import 'package:flutter/material.dart';
import 'package:to_do_list/model/model.dart';
import 'package:to_do_list/presenter/presenter.dart';
import 'package:to_do_list/view/view.dart';
import 'package:to_do_list/utils/constants.dart';
import 'package:to_do_list/utils/todo_tile.dart';
import 'package:to_do_list/utils/modal_bottom.dart';

class HomePage extends StatefulWidget {
  const HomePage(this.presenter, {Key? key, required this.title})
      : super(key: key);

  final String title;
  final AppPresenter presenter;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> implements AppView {
  late Model _model;

  @override
  void refreshData(Model model) {
    setState(() {
      _model = model;
    });
  }

  @override
  void initState() {
    super.initState();
    widget.presenter.view = this;

    widget.presenter.initialApp();
  }

  @override
  Widget build(BuildContext context) {
    // widget.presenter.view = this;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: kAppBarTextStyle,
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: _model.db.toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: _model.db.toDoList[index][0],
            taskCompleted: _model.db.toDoList[index][1],
            onChanged: (value) =>
                widget.presenter.checkBoxChanged(value, index),
            deleteFunction: (context) => widget.presenter.deleteTask(index),
          );
        },
      ),
      floatingActionButton: FloatingActionTask(
        modelApp: _model,
        textFieldActionTask: (value) {
          _model.newTask = value;
        },
        addButtonActionTask: () {
          widget.presenter.addTask();
          Navigator.pop(context);
        },
      ),
    );
  }
}
