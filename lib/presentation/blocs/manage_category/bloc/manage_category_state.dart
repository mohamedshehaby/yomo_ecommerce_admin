part of 'manage_category_bloc.dart';

class ManageCategoryFailureState extends ManageCategoryState {
  final Failure failure;
  const ManageCategoryFailureState({
    required this.failure,
  });

  @override
  List<Object> get props => [failure];
}

class ManageCategoryLoadingState extends ManageCategoryState {}

abstract class ManageCategoryState extends Equatable {
  const ManageCategoryState();
  @override
  List<Object> get props => [];
}

class ManageCategorySuccessState extends ManageCategoryState {}
