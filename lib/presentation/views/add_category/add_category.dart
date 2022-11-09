import 'package:flutter/material.dart';
import 'package:yomo_ecommerce/presentation/resources/strings_manager.dart';

class AddCategoryView extends StatelessWidget {
  const AddCategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.addCategory),
      ),
    );
  }
}
