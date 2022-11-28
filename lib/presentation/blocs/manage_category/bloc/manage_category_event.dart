part of 'manage_category_bloc.dart';

abstract class ManageCategoryEvent extends Equatable {
  const ManageCategoryEvent();

  @override
  List<Object> get props => [];
}

class ManageCategoryCategoryAdded extends ManageCategoryEvent {
  final String name;
  final String imagePath;
  const ManageCategoryCategoryAdded({
    required this.name,
    required this.imagePath,
  });

  @override
  List<Object> get props => [name, imagePath];
}
