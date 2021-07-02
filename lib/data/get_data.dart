import 'package:yaml/yaml.dart';
import "package:flutter/services.dart" as s;

Future<dynamic> getData() async {
  String data = await s.rootBundle.loadString('menu.yaml');

  return loadYaml(data);
}
