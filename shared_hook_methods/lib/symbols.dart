import 'package:mason/mason.dart';

String green(String val) => '${lightGreen.wrap(val)}';

String get check => green('✓');
String get question => green('?');
