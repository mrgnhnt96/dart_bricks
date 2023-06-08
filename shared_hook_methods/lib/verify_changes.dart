import 'package:mason/mason.dart';
import 'package:shared_hook_methods/symbols.dart';

String verifyChanges({
  required String one,
  required String two,
  required String purpose,
  required Logger logger,
}) {
  if (one == two) {
    return one;
  }

  final choices = [
    "Yeah, that's fine",
    "Don't change it",
    "I'll do it myself",
  ];

  final confirmed = logger.chooseOne(
    '$question `$one` was changed to `$two` ($purpose), is that okay?',
    choices: choices,
    defaultValue: choices.first,
  );

  if (choices.indexOf(confirmed) == 0) {
    return two;
  }

  if (choices.indexOf(confirmed) == 1) {
    return one;
  }

  final manual = logger.prompt("$question Fine, what's the new value:");

  return manual;
}
