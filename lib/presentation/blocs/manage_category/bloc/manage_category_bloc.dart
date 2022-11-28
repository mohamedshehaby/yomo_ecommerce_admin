import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:yomo_ecommerce/data/error_handling/failure.dart';
import 'package:yomo_ecommerce/domain/models/category.dart';
import 'package:yomo_ecommerce/domain/repository/repository.dart';

part 'manage_category_event.dart';
part 'manage_category_state.dart';

class ManageCategoryBloc
    extends Bloc<ManageCategoryEvent, ManageCategoryState> {
  Repository repository;
  ManageCategoryBloc({required this.repository})
      : super(ManageCategoryLoadingState()) {
    on<ManageCategoryCategoryAdded>(_onCategoryAdded);
  }

  _onCategoryAdded(ManageCategoryCategoryAdded event,
      Emitter<ManageCategoryState> emit) async {
    final newCategory =
        Category.init(name: event.name, imageUrl: event.imagePath);
    emit(ManageCategoryLoadingState());
    (await repository.addCategory(newCategory)).fold(
        (failure) => emit(ManageCategoryFailureState(failure: failure)), (_) {
      emit(ManageCategorySuccessState());
    });
  }
}
