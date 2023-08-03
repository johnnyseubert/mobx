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

  // Listas precisam ser observáveis para ter reatividade uma simples List na funciona
  ObservableList<String> todoList = ObservableList<String>();

  @action
  void addTodo() {
    todoList.add(newTodoTitle);
    newTodoTitle = '';
  }
}
