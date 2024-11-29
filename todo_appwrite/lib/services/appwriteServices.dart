import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';

class Appwriteservices {
  late Client client;
  late Databases databases;
  static const endpoint = 'https://cloud.appwrite.io/v1';
  static const projectId = '674065910008762ea441';
  static const databaseId = '674067120016883de1f0';
  static const collectionId = '6740674800211dd2e482';

  Appwriteservices() {
    client = Client();
    client.setEndpoint(endpoint);
    client.setProject(projectId);
    databases = Databases(client);
  }

  Future<Document> addtask(String _task) async {
    try {
      final documentId = ID.unique();
      print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
      print(documentId);
      print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
      final result = await databases.createDocument(
          databaseId: databaseId,
          collectionId: collectionId,
          documentId: documentId,
          data: {'task': _task, 'isCompleted': false});
      return result;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<List<Document>> getTasks() async {
    try {
      final result = await databases.listDocuments(
          databaseId: databaseId, collectionId: collectionId);
      print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
      print(result);
      print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
      return result.documents;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<void> deleteTask(id) async {
    try {
      final result = await databases.deleteDocument(
          databaseId: databaseId, collectionId: collectionId, documentId: id);
    } catch (e) {
      print(e);
    }
  }

  Future<Document> updateTaskStatus(String documentId, bool isCompleted) async {
    try {
      final result = await databases.updateDocument(
          databaseId: databaseId,
          collectionId: collectionId,
          documentId: documentId,
          data: {'isCompleted': isCompleted});
      return result;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
