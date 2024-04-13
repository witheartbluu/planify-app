import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:planify/dto/todo.dart';
import 'package:planify/services/db_helper.dart';


class ToDoScreen extends StatefulWidget {
  const ToDoScreen({super.key});

  @override
  State<ToDoScreen> createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {
  final GlobalKey<FormState> _formStateKey = GlobalKey<FormState>();
  Future<List<ToDo>>? todo;
  late String _title;
  bool isUpdate = false;
  late int? todoIdForUpdate;
  late DBHelper dbHelper;
  final _toDoController = TextEditingController();

  @override
  void initState() {
    super.initState();
    dbHelper = DBHelper();
    refreshToDoLists();
  }

  @override
  void dispose() {
    _toDoController.dispose();
    dbHelper.close();
    super.dispose();
  }

  void cancelTextEditing() {
    _toDoController.text = '';
    setState(() {
      isUpdate = false;
      todoIdForUpdate = null;
    });
    closeKeyboard();
  }

  void closeKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  Future<void> refreshToDoLists() async {
    try {
      await dbHelper.initDatabase();
      setState(() {
        todo = dbHelper.getTodos() as Future<List<ToDo>>?;
        isUpdate = false;
      });
    } catch (error) {
      debugPrint('Error fetching books: $error');
    }
  }

  void createOrUpdateToDo() {
    _formStateKey.currentState?.save();
    if (!isUpdate) {
      dbHelper.add(ToDo(null, _title));
    } else {
      dbHelper.update(ToDo(todoIdForUpdate, _title));
    }
    _toDoController.text = '';
    refreshToDoLists();
  }

  void editToDo(BuildContext context, ToDo todo) {
    setState(() {
      isUpdate = true;
      todoIdForUpdate = todo.id!;
    });
    _toDoController.text = todo.title;
  }

  void deleteToDo(BuildContext context, int todoID) {
    setState(() {
      isUpdate = false;
    });
    _toDoController.text = '';
    dbHelper.delete(todoID);
    refreshToDoLists();
  }

  @override
  Widget build(BuildContext context) {
    var textFormField = TextFormField(
      onSaved: (value) {
        _title = value!;
      },
      autofocus: false,
      controller: _toDoController,
      decoration: InputDecoration(
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: !isUpdate ? Colors.purple : Colors.blue,
                  width: 2,
                  style: BorderStyle.solid)),
          labelText: !isUpdate ? 'Add To Do' : 'Edit To Do',
          icon:
              Icon(Icons.list, color: !isUpdate ? Colors.purple : Colors.blue),
          fillColor: Colors.white,
          labelStyle:
              TextStyle(color: !isUpdate ? Colors.purple : Colors.blue)),
    );
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Form(
            key: _formStateKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: textFormField,
                ),
              ],
            )),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
                onPressed: () {
                  createOrUpdateToDo();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: !isUpdate
                      ? Colors.purple
                      : Colors.blue, // Set background color
                  foregroundColor: Colors.white,
                ),
                child: !isUpdate ? const Text('Save') : const Text('Update')),
            const SizedBox(
              width: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  cancelTextEditing();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange, // Set background color
                  foregroundColor: Colors.white,
                ),
                child: const Text('Cancel')),
          ],
        ),
        const Divider(),
        Expanded(
            child: FutureBuilder(
          future: todo,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Text('No Data');
            }
            if (snapshot.hasData) {
              return generateList(snapshot.data!);
            }
            return const CircularProgressIndicator();
          },
        ))
      ],
    ));
  }

  Widget generateList(List<ToDo> todo) {
    return ListView.builder(
      itemCount: todo.length,
      itemBuilder: (context, index) => Slidable(
        // Customize appearance and behavior as needed
        key: ValueKey(index),
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              // An action can be bigger than the others.
              onPressed: (context) => editToDo(context, todo[index]),
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              icon: Icons.edit,
              label: 'Edit',
            ),
            SlidableAction(
              // An action can be bigger than the others.
              onPressed: (context) => deleteToDo(context, todo[index].id!),
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
            ),
          ],
        ), // Assuming each book has a unique id
        child: ListTile(title: Text(todo[index].title)),
      ),
    );
  }
}
