part of '../pre_gen.dart';

({String? interface, String name}) getInterfaceAndName(Logger logger) {
  String name;
  String? interface;

  final result = logger.prompt('$question Enter the name of the model:');

  name = verifyChanges(
    one: result,
    two: makeSingular(result),
    purpose: 'to be singular',
    logger: logger,
  );

  final proposedInterface = makePlural(name);

  final interfaceResult = logger.prompt(
    '$question Enter the name of the interface:',
    defaultValue: proposedInterface,
  );

  interface = verifyChanges(
    one: interfaceResult,
    two: makePlural(interfaceResult),
    purpose: 'to be plural',
    logger: logger,
  );

  return (interface: interface, name: name);
}
