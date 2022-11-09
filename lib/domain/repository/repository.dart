import 'package:dartz/dartz.dart';
import 'package:yomo_ecommerce/data/error_handling/failure.dart';

import '../models/category.dart';
import '../models/product.dart';

abstract class Repository {
  /// [getAllCategories] from firebase or return failure
  Future<Either<Failure, List<Category>>> getAllCategories();

  /// [getAllProducts] from firebase or return failure
  Future<Either<Failure, List<Product>>> getAllProducts(int? productsNum, String categoryName);
}
