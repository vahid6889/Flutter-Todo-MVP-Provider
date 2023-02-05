// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_list/utils/storage/exchange.dart';

class Model {
  var newTask;

  /// reference the hive box
  final todoBox = Hive.box('mvptodo');
  ExchangeData db = ExchangeData();
}
