import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:yomo_ecommerce/presentation/blocs/manage_category/bloc/manage_category_bloc.dart';
import 'package:yomo_ecommerce/presentation/blocs/validation/add_edit_category_bloc/bloc/add_edit_category_bloc.dart';
import 'package:yomo_ecommerce/presentation/resources/color_manager.dart';
import 'package:yomo_ecommerce/presentation/resources/strings_manager.dart';
import 'package:yomo_ecommerce/presentation/resources/values_manager.dart';
import 'package:yomo_ecommerce/presentation/widgets/dialog/show_adding_error_dialog.dart';
import 'package:yomo_ecommerce/presentation/widgets/loading/loading_screen/loading_screen.dart';

part 'widgets/category_image.dart';
part 'widgets/category_name.dart';
part 'widgets/save_category.dart';

class AddCategoryView extends StatelessWidget {
  const AddCategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.white),
        title: const Text(AppStrings.addCategory),
      ),
      body: BlocListener<ManageCategoryBloc, ManageCategoryState>(
        listener: (context, state) {
          if (state is ManageCategoryLoadingState) {
            LoadingScreen.instance()
                .show(context: context, text: 'Adding Category');
          } else if (state is ManageCategoryFailureState) {
            showAddingErrorDialog(context: context);
            LoadingScreen.instance().hide();
            Navigator.of(context).pop();
          } else if (state is ManageCategorySuccessState) {
            LoadingScreen.instance().hide();
            Navigator.of(context).pop();
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(AppPadding.p12),
          child: SingleChildScrollView(
            child: Column(
              children: const <Widget>[
                CategoryImage(),
                CategoryName(),
                SaveCategory()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
