import "package:cloud_firestore/cloud_firestore.dart";
import 'package:uuid/uuid.dart';
import 'dart:convert';




class BrandService {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String ref = "Brands";

  void createBrand(String name)
  {
    var uuidvar = new Uuid();
    String brandId = uuidvar.v1();

    _firestore.collection('brands').doc(brandId).set({'brandName':name});

  }

 void getBrands()
  {
    Stream<QuerySnapshot> data =  _firestore.collection(ref).snapshots();

  }
}