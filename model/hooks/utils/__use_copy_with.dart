part of '../pre_gen.dart';

bool useCopyWith(Logger logger) {
  if (directoryNameContains('repo')) {
    return false;
  }

  final choice = logger.chooseOne(
    'Would you like to annotate this model with copyWith?',
    choices: ['Yes', 'No'],
    defaultValue: 'Yes',
  );

  return choice == 'Yes';
}
