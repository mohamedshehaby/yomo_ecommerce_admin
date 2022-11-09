import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yomo_ecommerce/presentation/resources/values_manager.dart';

import '../../blocs/category/category_bloc.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
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
                    height: 50,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              categories[i].name,
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                            Row(
                              children: [
                                Container(
                                    margin: const EdgeInsets.symmetric(horizontal: AppMargin.m5),
                                    height: 30,
                                    width: 50,
                                    child: ElevatedButton(
                                        onPressed: () {}, child: const Icon(Icons.edit))),
                                SizedBox(
                                    height: 30,
                                    width: 50,
                                    child: ElevatedButton(
                                        style:
                                            ElevatedButton.styleFrom(backgroundColor: Colors.red),
                                        onPressed: () {},
                                        child: const Icon(
                                          Icons.delete,
                                        )))
                              ],
                            )
                          ],
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
