import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mob/stores/initializations.dart';
import 'package:mob/widgets/custom_text_field.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            loginStore.logout();
            Navigator.pop(context);
          },
        ),
        title: const Text('Tarefas'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        width: double.infinity,
        child: Column(
          children: [
            Observer(
              builder: (context) {
                return CustomTextField(
                  onChanged: listStore.setNewTodoTitle,
                  suffix: listStore.isNotEmptyString
                      ? IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: listStore.addTodo,
                        )
                      : null,
                );
              },
            ),
            Expanded(
              child: Observer(
                builder: (context) {
                  return ListView.builder(
                    itemCount: listStore.todoList.length,
                    itemBuilder: (context, index) {
                      final todo = listStore.todoList[index];

                      return Card(
                        child: Observer(
                          builder: (context) {
                            return ListTile(
                              title: Text(
                                'Tarefa ${todo.title}',
                              ),
                              trailing: Text(todo.done ? 'OK' : ''),
                              onTap: todo.toggleDone,
                            );
                          },
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
