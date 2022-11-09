import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yomo_ecommerce/presentation/resources/strings_manager.dart';
import 'package:yomo_ecommerce/presentation/views/add_category/add_category.dart';
import 'package:yomo_ecommerce/presentation/views/add_product/add_product.dart';
import 'package:yomo_ecommerce/presentation/views/categories/categories_view.dart';
import 'package:yomo_ecommerce/presentation/views/home/home_view.dart';
import 'package:yomo_ecommerce/presentation/views/orders/orders_view.dart';
import 'package:yomo_ecommerce/presentation/views/products/products_view.dart';
import 'package:yomo_ecommerce/presentation/views/splash/splash_view.dart';

import '../../app/dependency_injection.dart';
import '../blocs/category/category_bloc.dart';
import '../products/products_bloc.dart';

class Routes {
  static const String splashRoute = '/splash';
  static const String loginRoute = '/login';
  static const String signupRoute = '/signup';
  static const String homeRoute = '/home';
  static const String productsRoute = '/products';
  static const String categoriesRoute = '/categories';
  static const String addProductRoute = '/add-product';
  static const String addCategoryRoute = '/add-category';
  static const String ordersRoute = '/orders';
}

class RoutesGenerator {
  static Route getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.homeRoute:
        return MaterialPageRoute(builder: (_) => const HomeView());
      case Routes.productsRoute:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => ProductsBloc(repository: instance())
                    ..add(ProductStarted(categoryName: settings.arguments as String)),
                  child: ProductsView(
                    categoryName: settings.arguments as String,
                  ),
                ));
      case Routes.categoriesRoute:
        return MaterialPageRoute(
            builder: (_) => BlocProvider<CategoryBloc>(
                  child: const CategoriesView(),
                  create: (BuildContext context) {
                    return CategoryBloc(repository: instance())..add(CategoryStarted());
                  },
                ));
      case Routes.addCategoryRoute:
        return MaterialPageRoute(builder: (_) => const AddCategoryView());
      case Routes.addProductRoute:
        return MaterialPageRoute(builder: (_) => const AddProductView());
      case Routes.ordersRoute:
        return MaterialPageRoute(builder: (_) => const OrdersView());
      default:
        return _unKnownRoute();
    }
  }

  static Route _unKnownRoute() {
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(AppStrings.noRouteFound),
          ),
          body: const Center(child: Text(AppStrings.noRouteFound)),
        );
      },
    );
  }
}
