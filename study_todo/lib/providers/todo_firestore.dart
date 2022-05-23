import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:study_todo/models/todo.dart';

class TodosFirebase {
  late CollectionReference todoReference;
  late Stream<QuerySnapshot> todoStream;

  Future initDb() async {
    todoReference = FirebaseFirestore.instance.collection('todos');
    todoStream = todoReference.snapshots();
  }

  List<Todo> getTodos(AsyncSnapshot<QuerySnapshot> snapshot) {
    return snapshot.data!.docs.map((DocumentSnapshot document) {
      return Todo.fromSnapshot(document);
    }).toList();
  }

  Future addTodo(Todo todo) async {
    todoReference.add(todo.toMap());
  }

  Future deleteTodo(Todo todo) async {
    todo.reference?.delete();
  }
}