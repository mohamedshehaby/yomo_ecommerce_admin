part of '../add_category.dart';

class CategoryName extends StatelessWidget {
  const CategoryName({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddEditCategoryBloc, AddEditCategoryState>(
        buildWhen: (previous, current) => previous.catName != current.catName,
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: AppPadding.p12),
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: 'Category Name',
                  errorText:
                      state.catName.isEmpty ? 'Enter Category Name' : null),
              onChanged: ((value) {
                context
                    .read<AddEditCategoryBloc>()
                    .add(AddEditCategoryNameChanged(catName: value));
              }),
            ),
          );
        });
  }
}
