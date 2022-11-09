part of '../categories_view.dart';

class EditOrDeleteCategory extends StatelessWidget {
  const EditOrDeleteCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            margin: const EdgeInsets.symmetric(horizontal: AppMargin.m5),
            height: 30,
            width: 50,
            child: ElevatedButton(onPressed: () {}, child: const Icon(Icons.edit))),
        SizedBox(
            height: 30,
            width: 50,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                onPressed: () {},
                child: const Icon(
                  Icons.delete,
                )))
      ],
    );
  }
}
