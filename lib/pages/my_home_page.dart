import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_todo_with_bloc/blocs/todos/todos_bloc.dart';
import 'package:flutter_todo_with_bloc/models/todo_model.dart';
import 'package:flutter_todo_with_bloc/pages/add_todo_page.dart';

// models

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ToDo List with Bloc'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: IconButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AddTodoPage(),
                    )),
                icon: const Icon(Icons.add)),
          )
        ],
      ),
      body: BlocBuilder<TodosBloc, TodosState>(
        builder: (context, state) {
          if (state is TodosLoading) {
            return const CircularProgressIndicator();
          }
          if (state is TodosLoaded) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: const Text(
                      'Pending:',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: ListView.builder(
                      itemCount: state.todos.length,
                      itemBuilder: (BuildContext context, int index) {
                        return _todoCard(context, state.todos[index]);
                      },
                    ),
                  )
                ],
              ),
            );
          } else {
            return const Text('Ops! Algo deu errado');
          }
        },
      ),
    );
  }
}

Card _todoCard(BuildContext context, Todo todo) {
  return Card(
    child: ListTile(
      title: Text(
        '${todo.id} ${todo.task}',
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
      ),
      subtitle: Text(
        todo.desc,
        style: const TextStyle(fontSize: 14.0, color: Colors.black54),
      ),
      trailing: SizedBox(
        width: 96.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                context
                    .read<TodosBloc>()
                    .add(UpdateTodo(todo: todo.copyWith(isDone: true)));
              },
              icon: const Icon(Icons.check),
            ),
            IconButton(
              onPressed: () {
                context.read<TodosBloc>().add(DeleteTodo(todo: todo));
              },
              icon: const Icon(Icons.close),
            ),
          ],
        ),
      ),
    ),
  );
}
