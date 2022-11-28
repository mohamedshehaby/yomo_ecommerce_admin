part of '../add_category.dart';

class CategoryImage extends StatelessWidget {
  const CategoryImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        BlocBuilder<AddEditCategoryBloc, AddEditCategoryState>(
            buildWhen: (previous, current) =>
                previous.catImagePath != current.catImagePath,
            builder: (context, state) {
              final imagePath = state.catImagePath;
              return SizedBox(
                  height: MediaQuery.of(context).size.height / 3,
                  // decoration: const BoxDecoration(color: Colors.black),
                  child: imagePath.isEmpty
                      ? const Icon(
                          Icons.image,
                          size: 100,
                          color: ColorManager.darkPrimary,
                        )
                      : Image.file(File(imagePath)));
            }),
        ElevatedButton(
          onPressed: () {
            showBottomSheet(
              constraints: const BoxConstraints(maxHeight: AppSize.s100),
              backgroundColor: Colors.white,
              elevation: 5,
              context: context,
              builder: (context) {
                return Column(
                  children: [
                    _buildImagePicker(context, pickImageFromGallery,
                        AppStrings.pickFromGallery, Icons.photo_album),
                    _buildImagePicker(context, pickImageFromCamera,
                        AppStrings.pickFromCamera, Icons.camera),
                  ],
                );
              },
            );
          },
          child: const Text('Add Image'),
        ),
      ],
    );
  }

  pickImageFromCamera(BuildContext context) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    context
        .read<AddEditCategoryBloc>()
        .add(AddEditCategoryImageChanged(catImagePath: image?.path ?? ''));
    Navigator.of(context).pop();
  }

  pickImageFromGallery(BuildContext context) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    context
        .read<AddEditCategoryBloc>()
        .add(AddEditCategoryImageChanged(catImagePath: image?.path ?? ''));
    Navigator.of(context).pop();
  }

  Widget _buildImagePicker(
      BuildContext context, Function pickFn, String title, IconData icon) {
    return GestureDetector(
      onTap: () => pickFn(context),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(icon, size: AppSize.s50, color: ColorManager.lightPrimary),
          const SizedBox(
            width: AppSize.s25,
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ],
      ),
    );
  }
}
