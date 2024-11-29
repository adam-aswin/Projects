import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:todo_appwrite/services/appwriteServices.dart';
import 'package:todo_appwrite/taskTodo.dart';

class HompageTodo extends StatefulWidget {
  const HompageTodo({super.key});

  @override
  State<HompageTodo> createState() => _HompageTodoState();
}

class _HompageTodoState extends State<HompageTodo> {
  TextEditingController _controller = TextEditingController();
  late Appwriteservices _appwriteservices;
  List? task;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _appwriteservices = Appwriteservices();
    loadTask();
    task = [];
  }

  Future<void> addTask() async {
    final _task = _controller.text;
    if (_task.isNotEmpty) {
      try {
        await _appwriteservices.addtask(_task);
        _controller.clear();
        loadTask();
      } catch (e) {
        print(e);
      }
    }
  }

  Future<void> loadTask() async {
    try {
      final tasks = await _appwriteservices.getTasks();
      setState(() {
        task = tasks.map((e) => Task.forDocument(e)).toList();
        print("//////////////////////////");
        print(task);
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> _updateTAskStatus(Task task) async {
    try {
      final updateTask =
          await _appwriteservices.updateTaskStatus(task.id, !task.isCompleted);
      setState(() {
        task.isCompleted != updateTask.data['completed'];
        loadTask();
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(242, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * .7,
                  height: 45,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 5,
                          spreadRadius: 0,
                          color: const Color.fromARGB(255, 183, 183, 183),
                          offset: Offset(5, 5),
                        ),
                      ]),
                  child: Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            color: Colors.deepPurple,
                            width: 2,
                          ),
                        ),
                        hintText: "Add task",
                        hintStyle: TextStyle(
                          color: Colors.black38,
                        ),
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 8,
                    backgroundColor: Colors.deepPurple,
                  ),
                  onPressed: () {
                    addTask();
                  },
                  child: Text(
                    "ADD",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.only(top: 20),
                itemCount: task!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onLongPress: () {
                      _appwriteservices.deleteTask(task![index].id);
                      loadTask();
                    },
                    title: Text(
                      task![index].task,
                      style: TextStyle(
                          decoration: task![index].isCompleted
                              ? TextDecoration.lineThrough
                              : null),
                    ),
                    trailing: IconButton(
                      onPressed: () => _updateTAskStatus(task![index]),
                      icon: Icon(Icons.check),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
