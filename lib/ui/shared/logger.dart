import 'dart:convert';

import 'package:meta/meta.dart';

import 'pretty_json.dart';

class Log {
  factory Log() => _instance;

  Log._(this.production);

  static void init([bool production = false]) => _instance = Log._(production);

  static Log _instance;

  final bool production;

  String debug(String tag, [dynamic payload]) {
    var output = '';
    if (production) return '';
    try {
      output = generator('=', tag, jsonPretty(json.decode(payload)));
    } catch (e) {
      output = generator('=', tag, payload);
    }

    return output;
  }

  String error(String tag, [dynamic payload]) {
    if (production) return '';
    final output = generator('*', tag, payload);

    return output;
  }

  @visibleForTesting
  String generator(String delim, String tag, [dynamic payload]) {
    if (production) return '';
    var _ = '';

    final _d = delim.padRight(20, delim);
    _ += '\n$delim> $tag $_d>\n';
    if (payload != null) {
      _ += '$payload \n$_d\n';
    }

    return _;
  }
}
