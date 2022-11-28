part of 'add_edit_category_bloc.dart';

class AddEditCategoryState {
  final String catName;
  final String catImagePath;

  const AddEditCategoryState({
    this.catName = '',
    this.catImagePath = '',
  });

  @override
  List<Object> get props => [catName, catImagePath];

  AddEditCategoryState copyWith({
    String? catName,
    String? catImagePath,
  }) {
    return AddEditCategoryState(
      catName: catName ?? this.catName,
      catImagePath: catImagePath ?? this.catImagePath,
    );
  }
}
