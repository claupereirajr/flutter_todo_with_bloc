import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo_with_bloc/blocs/todos/todos_bloc.dart';
import 'package:flutter_todo_with_bloc/models/todo_model.dart';

import 'pages/pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TodosBloc()
            ..add(LoadTodos(todos: [
              Todo(id: '1', task: 'Fazer café', desc: 'Fazer café da manhã'),
              Todo(
                  id: '2',
                  task: 'Tomar remédios',
                  desc: 'Tomar remédios depois de comer'),
              Todo(
                  id: '3',
                  task: 'Fazer marmita',
                  desc: 'Fazer marmita antes do banho')
            ])),
        ),
      ],
      child: MaterialApp(
        title: 'Todo List with Bloc',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}
