const _SERVER_ZONE_OFFSET = Duration(hours: 6);

class Parse {
  /// Parse a value that is formatted as an amount, with thousands separators and
  /// possibly a comma instead of the radix point.
  static double amount(String input) {
    if (input == null) {
      return null;
    }

    String processed = input;
    if (processed.indexOf(' ') >= 0) {
      processed = processed.replaceAll(' ', '');
    }
    if (processed.indexOf('\u00a0') >= 0) {
      processed = processed.replaceAll('\u00a0', '');
    }

    return double.tryParse(processed);
  }

  static DateTime date(dynamic input) {
    if (input != null) {
      if (input is String) {
        if (input.contains('T')) {
          return DateTime.tryParse(input)?.add(DateTime.now().timeZoneOffset);
        } else {
          return DateTime.tryParse(input)?.add(DateTime.now().timeZoneOffset - _SERVER_ZONE_OFFSET);
        }
      } else if (input is int) {
        return DateTime.fromMillisecondsSinceEpoch(input);
      }
    }

    return null;
  }

  static int integer(dynamic input, {int defaultValue}) {
    if (input != null) {
      if (input is String) {
        return int.tryParse(input) ?? defaultValue;
      } else if (input is num) {
        return input.toInt();
      }
    }
    return defaultValue;
  }

  static double float(dynamic input, {double defaultValue = 0.0}) {
    if (input != null) {
      if (input is String) {
        return double.tryParse(input) ?? defaultValue;
      } else if (input is num) {
        return input.toDouble();
      }
    }

    return defaultValue;
  }

  static bool boolean(dynamic input, {bool defaultValue = false}) {
    if (input != null) {
      if (input is bool) {
        return input;
      } else if (input is num) {
        return input > 0;
      } else if (input is String) {
        return input == 'true';
      }
    }
    return defaultValue;
  }

  static String string(dynamic input, {String defaultValue}) {
    if (input is String) {
      return input;
    } else {
      return input?.toString() ?? defaultValue;
    }
  }

  static Map<String, dynamic> map(dynamic input) {
    if (input is Map<String, dynamic>) {
      return input;
    }
    return null;
  }

  /// Retrieve a nested field from [json] according to [keys], which
  /// specifies the nesting hierarchy as a sequence of keys separated by dots ('.').
  ///
  /// For example, the key 'a.b.c' will retrieve the value of 5 from the following map:
  /// {
  ///   a: {
  ///     b: { c: 5 },
  ///     c: 7
  ///   },
  ///   c: 8
  /// }
  static dynamic nested(Map<String, dynamic> json, String keys) {
    final splitKeys = keys.split('.');
    Map<String, dynamic> currentObject = json;
    for (int i = 0; i < splitKeys.length - 1; i++) {
      final key = splitKeys[i];

      final value = map(currentObject[key]);
      if (value != null) {
        currentObject = value;
      }
    }

    return currentObject[splitKeys.last];
  }

  /// Attempt to parse a list of T.
  static List<T> list<T>(dynamic input, [T Function(dynamic) converter]) {
    if (input is List) {
      if (converter != null) {
        return input.map((it) => converter(it)).toList();
      } else {
        return input;
      }
    }
    return null;
  }

  /// Parse a duration from the number of seconds since the Epoch.
  static Duration duration(dynamic input) {
    if (input is num) {
      return Duration(seconds: input);
    }
    return null;
  }
}
