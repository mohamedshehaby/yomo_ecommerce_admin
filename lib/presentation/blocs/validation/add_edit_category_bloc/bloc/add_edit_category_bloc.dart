import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'add_edit_category_event.dart';
part 'add_edit_category_state.dart';

class AddEditCategoryBloc
    extends Bloc<AddEditCategoryEvent, AddEditCategoryState> {
  AddEditCategoryBloc() : super(const AddEditCategoryState()) {
    on<AddEditCategoryNameChanged>(_onNameChanged);
    on<AddEditCategoryImageChanged>(_onImageChanged);
  }

  _onImageChanged(
      AddEditCategoryImageChanged event, Emitter<AddEditCategoryState> emit) {
    emit((state).copyWith(catImagePath: event.catImagePath));
  }

  _onNameChanged(
      AddEditCategoryNameChanged event, Emitter<AddEditCategoryState> emit) {
    emit((state).copyWith(catName: event.catName));
  }
}
