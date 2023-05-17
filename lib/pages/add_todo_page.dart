import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo_with_bloc/models/todo_model.dart';
import 'package:flutter_todo_with_bloc/widgets/inpuit_field.dart';

import '../blocs/todos/todos_bloc.dart';

class AddTodoPage extends StatelessWidget {
  const AddTodoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController controllerId = TextEditingController();
    TextEditingController controllerTask = TextEditingController();
    TextEditingController controllerDescription = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Task'),
      ),
      body: BlocListener<TodosBloc, TodosState>(
        listener: (context, state) {
          if (state is TodosLoaded) {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text('Task Added')));
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              InputField(
                  type: TextInputType.number,
                  label: 'Id',
                  controller: controllerId),
              InputField(
                  type: TextInputType.text,
                  label: 'Task',
                  controller: controllerTask),
              InputField(
                  type: TextInputType.text,
                  label: 'Description',
                  controller: controllerDescription),
              const SizedBox(
                height: 16.0,
              ),
              ElevatedButton(
                onPressed: () {
                  var todo = Todo(
                    id: controllerId.value.text,
                    task: controllerTask.value.text,
                    desc: controllerDescription.value.text,
                  );
                  context.read<TodosBloc>().add(
                        CreateTodo(todo: todo),
                      );
                  Navigator.pop(context);
                },
                child: const SizedBox(
                  width: 120.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.send),
                      SizedBox(
                        width: 12.0,
                      ),
                      Text('Salvar'),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
