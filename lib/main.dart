import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_list/view/home_page.dart';
import 'package:to_do_list/presenter/presenter.dart';
import 'package:to_do_list/utils/constants.dart';

void main() async {
  /// init the hive
  await Hive.initFlutter();

  /// open a box
  var box = await Hive.openBox('mvptodo');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      theme: ThemeData.dark().copyWith(
        appBarTheme: const AppBarTheme(backgroundColor: kAppBarBackgroundColor),
        scaffoldBackgroundColor: kScaffoldBackgroundColor,
      ),
      home: HomePage(BasicAppPresenter(), title: 'Task List'),
    );
  }
}
