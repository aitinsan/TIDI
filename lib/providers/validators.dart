import 'package:homebank/providers/validationUtils.dart';

class ValidationResult {
  final String message;
  final List<Object> formatValues;

  const ValidationResult(this.message, [this.formatValues]);
}

typedef ValidationResult Validator<T>(T value, String fieldName);

abstract class Validators {
  // Validator functions
  static ValidationResult required(dynamic val, [String fieldName = '']) {
    if (val == null || (val is String && val.isEmpty)) {
      return ValidationResult('Заполните поле');
    }
    return null;
  }

  static ValidationResult mobilePhone(String val, String fieldName) {
    final requiredMessage = Validators.required(val, fieldName);
    if (requiredMessage != null) {
      return requiredMessage;
    }

    if (!ValidationUtils.isValidMobilePhone(val)) {
      return ValidationResult('Введите правильно номер');
    }
    return null;
  }

  static ValidationResult password(String val, String fieldName) {
    if (val.length < 6) {
      return ValidationResult('пароль должен быть больше 6 символов', [6]);
    }
    if (val.length > 255) {
      return ValidationResult('255 максимальное количество символов', [255]);
    }
    return null;
  }

  static ValidationResult bin(String val, String fieldName) {
    if (!ValidationUtils.isValidBin(val)) {
      return ValidationResult('Введите достоверный бин');
    }
    return null;
  }

  static ValidationResult email(String val, String fieldName) {
    if (!ValidationUtils.isValidEmail(val)) {
      return ValidationResult('не правильная почта');
    }
    return null;
  }

  static ValidationResult trueRequired(bool val, String fieldName) {
    if (!val) {
      return ValidationResult('заполните поле');
    }
    return null;
  }
}
