part of 'add_edit_category_bloc.dart';

abstract class AddEditCategoryEvent extends Equatable {
  const AddEditCategoryEvent();

  @override
  List<Object> get props => [];
}

class AddEditCategoryNameChanged extends AddEditCategoryEvent {
  final String catName;
  const AddEditCategoryNameChanged({
    required this.catName,
  });
  @override
  List<Object> get props => [catName];
}

class AddEditCategoryImageChanged extends AddEditCategoryEvent {
  final String catImagePath;
  const AddEditCategoryImageChanged({
    required this.catImagePath,
  });

  @override
  List<Object> get props => [catImagePath];
}
