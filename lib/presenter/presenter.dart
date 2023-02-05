import 'package:to_do_list/view/view.dart';
import 'package:to_do_list/model/model.dart';

class AppPresenter {
  set view(AppView value) {}

  void checkBoxChanged(bool? value, int index) {}
  void deleteTask(int index) {}
  void addTask() {}
  void initialApp() {}
}

class BasicAppPresenter implements AppPresenter {
  late Model _model;
  late AppView _view;

  BasicAppPresenter() {
    _model = Model();
  }

  @override
  set view(AppView value) {
    // TODO: implement view
    _view = value;
    _view.refreshData(_model);
  }

  /// if this is the 1st time ever opening  the app, the create default data
  @override
  void initialApp() {
    if (_getData() == null) {
      _initialData();
    } else {
      /// there already exists data
      _loadData();
    }
  }

  List _getData() {
    return _model.todoBox.get('TODOTASKS');
  }

  List? _loadData() {
    return _model.db.loadData();
  }

  void _initialData() {
    _model.db.createInitialData();
  }

  /// checkbox was tapped
  @override
  void checkBoxChanged(bool? value, int index) {
    _model.db.toDoList[index][1] = !_model.db.toDoList[index][1];
    _model.db.updateDatabase();
    _view.refreshData(_model);
  }

  /// delete task
  @override
  void deleteTask(int index) {
    _model.db.toDoList.removeAt(index);
    _model.db.updateDatabase();
    _view.refreshData(_model);
  }

  /// add new task
  @override
  void addTask() {
    if (_model.newTask != null) {
      _model.db.toDoList.add([_model.newTask, false]);
      _model.newTask = null;
      _model.db.updateDatabase();
      _view.refreshData(_model);
    }
  }
}
