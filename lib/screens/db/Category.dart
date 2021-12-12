import "package:cloud_firestore/cloud_firestore.dart";
import 'package:uuid/uuid.dart';

class CategoryService {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;


  void createCategory(String name)
  {
    var uuidvar = new Uuid();
    String categoryId = uuidvar.v1();

    _firestore.collection('categories').doc(categoryId).set({'CategoryName':name});

  }

}