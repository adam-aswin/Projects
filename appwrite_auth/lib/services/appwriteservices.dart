import 'dart:math';

import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';

class Appwriteservices {
  late Client client;
  late Account account;

  static const endpoint = 'https://cloud.appwrite.io/v1';
  static const projectId = '6746f9e000109ec00c6b';

  Appwriteservices() {
    client = Client();

    client.setEndpoint(endpoint).setProject(projectId);
    account = Account(client);
  }

  Future<void> registerUser(String email, String password, String name) async {
    try {
      final response = await account.create(
          userId: ID.unique(), email: email, password: password, name: name);
      print('User register: ${response.$id}');
    } catch (e) {
      print('Error: ${e}');
    }
  }

  Future<void> loginUser(String email, String password) async {
    try {
      final session = await account.createEmailPasswordSession(
          email: email, password: password);
      print('User logged in:${session.userId}');
    } on AppwriteException catch (e) {
      if (e.code == 401) {
        print('Error: incorrect email or password');
        throw Exception('Incorrect email or password');
      } else {
        print('Error: ${e.message}');
        throw Exception(e.message);
      }
    } catch (e) {
      print('Unexpted error: $e');
      throw Exception('An error occured');
    }
  }
}
