import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:yomo_ecommerce/data/data_source/remote_data_source.dart';
import 'package:yomo_ecommerce/data/error_handling/failure.dart';
import 'package:yomo_ecommerce/data/network/network_info.dart';
import 'package:yomo_ecommerce/domain/repository/repository.dart';
import 'package:yomo_ecommerce/presentation/resources/strings_manager.dart';

import '../../domain/models/category.dart';
import '../../domain/models/product.dart';

class RepositoryImpl implements Repository {
  final RemoteDataSource _remoteDataSource;

  final NetworkInfo _networkInfo;

  const RepositoryImpl({
    required RemoteDataSource remoteDataSource,
    required NetworkInfo networkInfo,
  })  : _remoteDataSource = remoteDataSource,
        _networkInfo = networkInfo;

  @override
  Future<Either<Failure, List<Category>>> getAllCategories() async {
    if (await _networkInfo.isConnected) {
      try {
        // Get all categorises docs
        final docs = await _remoteDataSource.getAllCategories();
        // Convert it to List<Category>
        final categories =
            docs.map((doc) => Category.fromMap(doc.data() as Map<String, dynamic>)).toList();

        return Right(categories);
      } on FirebaseException catch (e) {
        return Left(Failure(title: e.code, message: e.message ?? e.plugin));
      } catch (e) {
        return Left(Failure(title: AppStrings.errorHappened, message: e.toString()));
      }
    } else {
      return Left(Failure.noInternet());
    }
  }

  @override
  Future<Either<Failure, List<Product>>> getAllProducts(
    int? productsNum,
    String categoryName,
  ) async {
    if (await _networkInfo.isConnected) {
      try {
        // Get all products docs based on productsNum and categoryName
        final docs = await _remoteDataSource.getAllProducts(productsNum, categoryName);

        // Convert it to List<Product>
        final products =
            docs.map((doc) => Product.fromMap(doc.data() as Map<String, dynamic>)).toList();
        return Right(products);
      } on FirebaseException catch (e) {
        return Left(Failure(title: e.code, message: e.message ?? AppStrings.empty));
      } catch (e) {
        return Left(Failure(title: AppStrings.errorHappened, message: e.toString()));
      }
    } else {
      return Left(Failure.noInternet());
    }
  }
}
