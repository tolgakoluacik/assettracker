import 'package:easy_localization/easy_localization.dart';
import 'custom_text_field.dart';

class EmailTextField extends CustomTextField {
  EmailTextField({
    super.key,
    super.controller,
  }) : super(
    labelText: 'email'.tr(),
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'emailRequired'.tr();
      }
      if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$").hasMatch(value)) {
        return 'emailValid'.tr();
      }
      return null;
    },
  );
}