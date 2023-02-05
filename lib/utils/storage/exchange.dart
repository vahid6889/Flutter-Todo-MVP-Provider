import 'package:hive_flutter/hive_flutter.dart';

class ExchangeData {
  List toDoList = [];

  /// reference the box
  final _todoBox = Hive.box('mvptodo');

  /// run this method if this is the 1st time opening this app
  void createInitialData() {
    toDoList = [
      [
        'Make Tutorial',
        false,
      ],
      [
        'Do Exercise',
        true,
      ],
    ];
  }

  /// load the data from database
  List? loadData() {
    return toDoList = _todoBox.get('TODOTASKS');
  }

  /// update the database
  void updateDatabase() {
    _todoBox.put('TODOTASKS', toDoList);
  }
}
