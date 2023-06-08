part of '../pre_gen.dart';

({String? interface, String name}) getInterfaceAndName(
  Logger logger, {
  required bool isInterface,
}) {
  String name;
  String? interface;

  final result = logger.prompt('$question Enter the name of the model:');

  name = verifyChanges(
    one: result,
    two: makeSingular(result),
    purpose: 'to be singular',
    logger: logger,
  );

  if (isInterface) {
    final proposedInterface = makePlural(name);

    final result = logger.prompt(
      '$question Enter the name of the interface:',
      defaultValue: proposedInterface,
    );

    interface = verifyChanges(
      one: result,
      two: makePlural(result),
      purpose: 'to be plural',
      logger: logger,
    );
  }

  return (interface: interface, name: name);
}
