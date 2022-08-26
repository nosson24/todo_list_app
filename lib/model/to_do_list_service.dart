import 'package:cloud_firestore/cloud_firestore.dart';

deleteTodos(item) {
  DocumentReference documentReference =
      FirebaseFirestore.instance.collection("MyTodos").doc(item);

  documentReference.delete().whenComplete(() {
    print("$item Deleted");
  });
}