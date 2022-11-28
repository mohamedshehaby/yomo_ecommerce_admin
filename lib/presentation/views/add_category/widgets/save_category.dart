part of '../add_category.dart';

class SaveCategory extends StatelessWidget {
  const SaveCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddEditCategoryBloc, AddEditCategoryState>(
        builder: (context, state) {
      return ElevatedButton(
          onPressed: (state.catImagePath.isEmpty || state.catName.isEmpty)
              ? null
              : () {
                  context.read<ManageCategoryBloc>().add(
                      ManageCategoryCategoryAdded(
                          name: state.catName, imagePath: state.catImagePath));
                },
          child: const Text(AppStrings.save));
    });
  }
}
