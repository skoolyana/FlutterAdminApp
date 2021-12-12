import "package:cloud_firestore/cloud_firestore.dart";
import 'package:uuid/uuid.dart';
import '../db/Category.dart';
import '../db/Brand.dart';




class BrandService {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;


  void createBrand(String name)
  {
    var uuidvar = new Uuid();
    String brandId = uuidvar.v1();

    _firestore.collection('brands').doc(brandId).set({'brandName':name});

  }

}