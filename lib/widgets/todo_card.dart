import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo_with_bloc/blocs/todos/todos_bloc.dart';
import 'package:flutter_todo_with_bloc/models/models.dart';

abstract class TodoCard extends StatelessWidget {
  final Todo todo;
  const TodoCard({Key? key, required this.todo}) : super(key: key);

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
                onPressed: () {},
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
}
