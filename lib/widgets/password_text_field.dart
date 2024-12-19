import 'package:easy_localization/easy_localization.dart';
import 'custom_text_field.dart';

class PasswordTextField extends CustomTextField {
  PasswordTextField({
    super.key,
    super.controller,
  }) : super(
    labelText: 'password'.tr(),
    obscureText: true,
    validator: (value) {
      int passwordMinLength = 6;
      if (value == null || value.isEmpty) {
        return 'passwordRequired'.tr();
      }
      if (value.length < passwordMinLength) {
        return 'passwordMinLength'.tr(args: [passwordMinLength.toString()]);
      }
      return null;
    },
  );
}