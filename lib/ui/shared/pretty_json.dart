import 'dart:convert';

String jsonPretty(Object obj) {
  final encoder = JsonEncoder.withIndent('  ');
  final prettyprint = encoder.convert(obj);
  return prettyprint;
}
