import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

const String users = 'users';

const String products = 'products';
const String cartItems = 'cartItems';
const String categories = 'categories';
const String category = 'category';
const String orders = 'orders';

abstract class RemoteDataSource {
  /// [getAllCategories] from categories collection at firestore
  Future<List<QueryDocumentSnapshot>> getAllCategories();
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final _firestore = FirebaseFirestore.instance;
  final _fireAuth = FirebaseAuth.instance;
  final _storageRef = FirebaseStorage.instance.ref();

  @override
  Future<List<QueryDocumentSnapshot>> getAllCategories() {
    return _firestore.collection(categories).get().then((querySnapshot) => querySnapshot.docs);
  }
}
