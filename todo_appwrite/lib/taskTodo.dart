import 'package:appwrite/models.dart';

class Task {
  final String id;
  final String task;
  final bool isCompleted;

  Task({
    required this.id,
    required this.task,
    required this.isCompleted,
  });

  factory Task.forDocument(Document doc) {
    print(doc);
    return Task(
        id: doc.$id,
        task: doc.data['task'],
        isCompleted: doc.data['isCompleted']);
  }
}
