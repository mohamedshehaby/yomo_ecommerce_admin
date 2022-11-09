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

  /// [getAllProducts] from products collection at firestore
  Future<List<QueryDocumentSnapshot>> getAllProducts(int? productsNum, String categoryName);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final _firestore = FirebaseFirestore.instance;
  final _fireAuth = FirebaseAuth.instance;
  final _storageRef = FirebaseStorage.instance.ref();

  @override
  Future<List<QueryDocumentSnapshot>> getAllCategories() {
    return _firestore.collection(categories).get().then((querySnapshot) => querySnapshot.docs);
  }

  @override
  Future<List<QueryDocumentSnapshot>> getAllProducts(int? productsNum, String categoryName) {
    final productsCollection = _firestore.collection(products);

    /// Get all the products based on [categoryName]
    if (productsNum == null) {
      return productsCollection
          .where(category, isEqualTo: categoryName)
          .get()
          .then((querySnapshot) => querySnapshot.docs);
    }

    /// Get limited products based on [categoryName]
    else {
      return productsCollection
          .where(category, isEqualTo: categoryName)
          .limit(productsNum)
          .get()
          .then((querySnapshot) => querySnapshot.docs);
    }
  }
}
