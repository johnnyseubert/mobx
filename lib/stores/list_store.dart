import 'package:mob/stores/todo_store.dart';
import 'package:mobx/mobx.dart';

part 'list_store.g.dart';

class ListStore = _List with _$ListStore;

abstract class _List with Store {
  @observable
  String newTodoTitle = '';

  @observable
  int age = 0;

  @action
  void setNewTodoTitle(String value) => newTodoTitle = value;

  @computed
  bool get isNotEmptyString => newTodoTitle.isNotEmpty;

  ObservableList<TodoStore> todoList = ObservableList<TodoStore>();

  @action
  void addTodo() {
    todoList.add(TodoStore(newTodoTitle));
    newTodoTitle = '';
  }
}
