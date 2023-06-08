part of '../pre_gen.dart';

String updateNameToPlural(String name, Logger logger) {
  final newName = name.replaceAll(RegExp(r'[^aeiou]s$'), '');

  if (newName == name) {
    return newName;
  }

  final choices = [
    'Proceed',
    "Don't change",
    "I'll do it myself",
  ];

  final confirmed = logger.chooseOne(
    'The name `$name` is plural. Updated to use `$newName` instead',
    choices: choices,
    defaultValue: choices.first,
  );

  if (choices.indexOf(confirmed) == 0) {
    return newName;
  }

  if (choices.indexOf(confirmed) == 1) {
    return name;
  }

  final manual = logger.prompt('Enter the new name (singular):');

  return manual;
}
