import 'package:mobx/mobx.dart';
import 'package:todomobx/stores/todo_store.dart';
part 'list_store.g.dart';

class ListStore = _ListStoreBase with _$ListStore;

abstract class _ListStoreBase with Store {

  ObservableList<TodoStore> todoList = ObservableList<TodoStore>();

  @observable
  String newTodoTitle = "";
  @action
  void setNewTodoTitle(String value) => newTodoTitle = value;

  @computed
  bool get isTodoValid => newTodoTitle.isNotEmpty;

  @action
  void addTodo(){
    todoList.insert(0, TodoStore(newTodoTitle));
    setNewTodoTitle("");
  }
}