import 'package:flutter/material.dart';
import 'package:yomo_ecommerce/presentation/resources/strings_manager.dart';

import '../../resources/routes_manager.dart';
import '../../resources/values_manager.dart';
import '../../widgets/custom_app_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildSectionCard(
                context, AppStrings.categories, _goToCategoriesView),
            _buildSectionCard(
                context, AppStrings.addCategory, _goToAddCategoryView),
            _buildSectionCard(
                context, AppStrings.addProduct, _goToAddProductView),
            _buildSectionCard(context, AppStrings.orders, _goToOrdersView)
          ],
        ),
      ),
    );
  }

  Widget _buildSectionCard(
      BuildContext context, String title, Function navFun) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / AppSize.s4,
      width: double.infinity,
      child: GestureDetector(
        onTap: () => navFun(context),
        child: Card(
          elevation: 1,
          child: Align(
              alignment: Alignment.center,
              child: Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall
                    ?.copyWith(decoration: TextDecoration.underline),
                textAlign: TextAlign.center,
              )),
        ),
      ),
    );
  }

  _goToAddCategoryView(BuildContext context) {
    Navigator.of(context).pushNamed(Routes.addCategoryRoute);
  }

  _goToAddProductView(BuildContext context) {
    Navigator.of(context).pushNamed(Routes.addProductRoute);
  }

  _goToCategoriesView(BuildContext context) {
    Navigator.of(context).pushNamed(Routes.categoriesRoute);
  }

  _goToOrdersView(BuildContext context) {
    Navigator.of(context).pushNamed(Routes.ordersRoute);
  }
}
