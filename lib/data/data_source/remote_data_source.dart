import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:yomo_ecommerce/data/error_handling/exceptions.dart';
import 'package:yomo_ecommerce/domain/models/app_user.dart';
import 'package:yomo_ecommerce/domain/models/category.dart';

const String cartItems = 'cartItems';

const String categories = 'categories';
const String category = 'category';
const String orders = 'orders';
const String products = 'products';
const String users = 'users';

abstract class RemoteDataSource {
  /// [addCategory]
  Future<void> addCategory(Category category);

  /// [getAllCategories] from categories collection at firestore
  Future<List<QueryDocumentSnapshot>> getAllCategories();

  /// [getAllProducts] from products collection at firestore
  Future<List<QueryDocumentSnapshot>> getAllProducts(
      int? productsNum, String categoryName);

  /// [getUser] info from users collection at firestore
  Future<DocumentSnapshot<Map<String, dynamic>>> getUser(String id);

  /// [login] user
  Future<User> login(String email, String password);

  /// [logout] user
  Future<void> logout();

  /// [signup] user
  Future<User> signup(String email, String password);

  /// [uploadImage]
  Future<void> uploadImage(String imagePath, String collection, String fileId);

  /// [uploadUser] info to users collection at firestore
  Future<void> uploadUser(AppUser appUser);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final _firestore = FirebaseFirestore.instance;
  final _fireAuth = FirebaseAuth.instance;
  final _storageRef = FirebaseStorage.instance.ref();

  @override
  Future<void> addCategory(Category category) async {
    final imageUrl =
        await uploadImage(category.imageUrl, 'categories', category.id);

    _firestore
        .collection('categories')
        .add(category.copyWith(imageUrl: imageUrl).toMap());
  }

  @override
  Future<List<QueryDocumentSnapshot>> getAllCategories() {
    return _firestore
        .collection(categories)
        .get()
        .then((querySnapshot) => querySnapshot.docs);
  }

  @override
  Future<List<QueryDocumentSnapshot>> getAllProducts(
      int? productsNum, String categoryName) {
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

  @override
  Future<DocumentSnapshot<Map<String, dynamic>>> getUser(String id) async {
    return await _firestore.collection(users).doc(id).get();
  }

  @override
  Future<User> login(String email, String password) async {
    final UserCredential userCredential = await _fireAuth
        .signInWithEmailAndPassword(email: email, password: password);
    final user = userCredential.user;

    // If for no reason the user can't be created then throw exception
    return (user != null) ? user : throw const NoUserException();
  }

  @override
  Future<void> logout() => _fireAuth.signOut();

  @override
  Future<User> signup(String email, String password) async {
    final UserCredential userCredential = await _fireAuth
        .createUserWithEmailAndPassword(email: email, password: password);
    final user = userCredential.user;

    // If for no reason the user can't be created then throw exception
    return (user != null) ? user : throw const NoUserException();
  }

  @override
  Future<String> uploadImage(
      String imagePath, String collection, String fileId) async {
    final storageReference =
        _storageRef.child(collection).child(fileId).child(fileId);
    await storageReference.putFile(File(imagePath));
    return storageReference.getDownloadURL();
  }

  @override
  Future<void> uploadUser(AppUser appUser) async {
    return _firestore.collection(users).doc(appUser.id).set(appUser.toMap());
  }
}
