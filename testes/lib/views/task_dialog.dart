import 'package:flutter/material.dart';

import 'package:testes/models/task.dart';

class TaskDialog extends StatefulWidget {
  final Task task;

  TaskDialog({this.task});

  @override
  _TaskDialogState createState() => _TaskDialogState();
}

class _TaskDialogState extends State<TaskDialog> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _tempController = TextEditingController();
  final _timeController = TextEditingController();

  Task _currentTask = Task();

  @override
  void initState() {
    super.initState();

    if (widget.task != null) {
      _currentTask = Task.fromMap(widget.task.toMap());
    }

    _titleController.text = _currentTask.title;
    _descriptionController.text = _currentTask.description;
    _tempController.text = _currentTask.tempoprevisto;
    _timeController.text = _currentTask.tempototal;
  }

  @override
  void dispose() {
    super.dispose();
    _titleController.clear();
    _descriptionController.clear();
    _tempController.clear();
    _timeController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.task == null ? 'Nova tarefa' : 'Editar tarefas'),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            TextField(
                controller: _titleController,
                decoration: InputDecoration(labelText: 'Título'),
                autofocus: true),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Descrição'),
            ),
            TextField(
              controller: _tempController,
              decoration:
                  InputDecoration(labelText: 'Tempo necessario em minutos'),
              keyboardType: TextInputType.datetime,
            ),
            TextField(
              controller: _timeController,
              decoration: InputDecoration(labelText: 'Tempo total em minutos'),
              keyboardType: TextInputType.datetime,
            ),
          ],
        ),
      ),
      actions: <Widget>[
        FlatButton(
          child: Text('Cancelar'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        FlatButton(
          child: Text('Salvar'),
          onPressed: () {
            _currentTask.title = _titleController.value.text;
            _currentTask.description = _descriptionController.text;
            _currentTask.tempoprevisto = _tempController.text;
            _currentTask.tempototal = _timeController.text;
            Navigator.of(context).pop(_currentTask);
          },
        ),
      ],
    );
  }
}
