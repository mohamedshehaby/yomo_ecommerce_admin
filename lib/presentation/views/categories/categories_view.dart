import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yomo_ecommerce/presentation/resources/values_manager.dart';

import '../../blocs/category/category_bloc.dart';
import '../../resources/routes_manager.dart';

part 'widgets/edit_or_delete_category.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.white,
        ),
        title: const Text('Categories'),
      ),
      body: BlocBuilder<CategoryBloc, CategoryState>(
        builder: (context, state) {
          if (state is CategoryLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is CategorySuccessState) {
            final categories = state.categories;
            return ListView.builder(
                itemCount: categories.length,
                itemBuilder: (context, i) {
                  return SizedBox(
                    height: AppSize.s50,
                    child: GestureDetector(
                      onTap: () => Navigator.of(context)
                          .pushNamed(Routes.productsRoute, arguments: categories[i].name),
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(AppPadding.p8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                categories[i].name,
                                style: Theme.of(context).textTheme.labelMedium,
                              ),
                              const EditOrDeleteCategory()
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                });
          }
          return Container();
        },
      ),
    );
  }
}
