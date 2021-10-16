import 'dart:async';

import 'package:homebank/providers/validators.dart';

import 'base_controller.dart';

class ValueModel<T> {
  final T _initialVal;
  final String fieldName;
  final BaseController _controller;

  bool _isRequired;

  /// Regular listeners
  final _listeners = List<void Function(T val)>();

  /// Listeners triggered only on non-silent updates.
  final _silentListeners = List<void Function(T val)>();

  T get initialVal => _initialVal;

  ValueModel({
    T initialVal,
    this.fieldName,
    BaseController controller,
    List<Validator<T>> validators,
  })  : _initialVal = initialVal,
        _controller = controller {
    _val = initialVal;

    if (validators != null) {
      _validators = validators;
    } else {
      _validators = [
        (T value, String fieldName) {
          return null;
        }
      ];
    }
  }

  T get val => _val;
  T _val;

  set val(T newVal) {
    if (_val != newVal) {
      _val = newVal;
      _validationError = null;
      _controller?.notifyListeners();
      _listeners.forEach((listener) => listener(newVal));
      _silentListeners.forEach((listener) => listener(newVal));
    }
  }

  /// Set the value if it has changed, and call only regular listeners
  /// (skipping non-silent listeners).
  void setValSilently(T newVal) {
    if (_val != newVal) {
      _val = newVal;
      _validationError = null;
      _controller?.notifyListeners();
      _listeners.forEach((listener) => listener(newVal));
    }
  }

  void reset() {
    val = _initialVal;
  }

  void addListener(void Function(T val) listener) {
    if (!_listeners.contains(listener)) {
      _listeners.add(listener);
    }
  }

  void removeListener(void Function(T val) listener) {
    _listeners.remove(listener);
  }

  void addSilentListener(void Function(T val) listener) {
    _silentListeners.add(listener);
  }

  void removeSilentListener(void Function(T val) listener) {
    _silentListeners.remove(listener);
  }

  void removeAllRegularListeners() {
    _listeners.clear();
  }

  void removeAllSilentListeners() {
    _silentListeners.clear();
  }

  StreamSubscription bindToStream(Stream<T> stream) {
    return stream.listen((data) => val = data);
  }

  static void resetValidation(List<ValueModel> models) {
    models.forEach((model) => model.clearValidationError());
  }

  static bool validateAll(List<ValueModel> models) {
    var allValid = true;
    models.forEach((model) {
      if (allValid) {
        allValid = model.validate();
      } else {
        model.validate();
      }
    });
    return allValid;
  }

  static bool someEmpty(List<ValueModel> models) {
    return !notEmptyAll(models);
  }

  static bool notEmptyAll(List<ValueModel> models) {
    var allFilled = true;
    models.forEach((model) {
      if (allFilled) {
        if (model.isRequired()) {
          allFilled = Validators.required(model.val) == null;
        }
      }
    });
    return allFilled;
  }

  bool isRequired() {
    if (_isRequired != null) {
      return _isRequired;
    } else {
      _recalculateRequired();
    }
    return _isRequired;
  }

  void _recalculateRequired() {
    _isRequired = validators.contains(Validators.required);
  }

  ValidationResult _validationError;

  ValidationResult get validationError => _validationError;

  set validationError(ValidationResult error) {
    if (error != null) _validationError = error;
  }

  bool get hasError => _validationError != null;

  clearValidationError() {
    _validationError = null;
    _controller?.notifyListeners();
  }

  List<Validator<T>> _validators;

  List<dynamic> get validators => _validators;

  bool validate() {
    ValidationResult validationError;
    for (int i = 0; i < _validators.length; i++) {
      if (validationError != null) {
        break;
      }
      validationError = _validators[i](_val, fieldName);
    }

    _validationError = validationError;
    _controller?.notifyListeners();

    return _validationError == null;
  }

  @override
  String toString() {
    return 'LiveData{_val: $_val, _initialVal: $_initialVal, fieldName: $fieldName, _validationError: $_validationError}';
  }
}
