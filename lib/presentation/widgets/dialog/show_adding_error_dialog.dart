import 'package:flutter/cupertino.dart';
import 'package:yomo_ecommerce/presentation/widgets/dialog/generic_dialog.dart';

Future<void> showAddingErrorDialog({required BuildContext context}) {
  return showGenericDialog<void>(
    context: context,
    title: 'Error',
    content: 'Error While Adding, try again later',
    optionsBuilder: () => {'ok': true},
  );
}
