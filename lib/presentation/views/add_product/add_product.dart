import 'package:flutter/material.dart';
import 'package:yomo_ecommerce/presentation/resources/strings_manager.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.addProduct),
      ),
    );
  }
}
