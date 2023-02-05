import 'package:flutter/material.dart';
import 'package:to_do_list/utils/constants.dart';

class FloatingActionTask extends StatelessWidget {
  FloatingActionTask({
    super.key,
    required this.textFieldActionTask,
    required this.addButtonActionTask,
    required this.modelApp,
  });

  Function(String?)? textFieldActionTask;
  Function()? addButtonActionTask;
  final modelApp;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        modelApp.newTask = null;
        showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return SizedBox(
              height: 600,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                      child: TextField(
                        autofocus: true,
                        decoration: const InputDecoration(
                          labelText: 'New Task',
                        ),
                        onChanged: textFieldActionTask,
                      ),
                    ),
                    const SizedBox(height: 30.0),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kBackgroundColorButton,
                        foregroundColor: kForegroundColorButton,
                      ),
                      onPressed: addButtonActionTask,
                      child: const Text('Add Task'),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
      tooltip: 'Add New Task',
      backgroundColor: kBackgroundColorButton,
      foregroundColor: kForegroundColorButton,
      child: const Icon(Icons.add),
    );
  }
}
