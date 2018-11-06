import 'dart:async';
import 'dart:html';
import 'package:angular/core.dart';

/// Mock service emulating access to a to-do list stored on a server.
@Injectable()
class TodoListService {
  //List<String> mockTodoList = <String>[];
  List<String> mockTodoList = thingsTodo().toList();

  Future<List<String>> getTodoList() async => mockTodoList;
}

Iterable<String> thingsTodo() sync* {
  var actions = ['Walk', 'Wash', 'Feed'];
  var pets = ['cats', 'dogs'];

  for (var action in actions) {
    for (var pet in pets) {
      if (pet == 'cats' && action != 'Feed') continue;
      yield '$action the $pet';
    }
  }

  UListElement todoList;

  void addTodoItem(String item) {
    print(item);

    var listElement = LIElement();
    listElement.text = item;
    todoList.children.add(listElement);
  }

  void main() {
    todoList = querySelector('#todolist');
    thingsTodo().forEach(addTodoItem);
  }
}
