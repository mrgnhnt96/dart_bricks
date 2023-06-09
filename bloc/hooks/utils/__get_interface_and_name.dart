part of '../pre_gen.dart';

({
  String? interface,
  String singular,
  String plural,
}) getInterfaceAndName(Types type, Logger logger) {
  String name;
  String? interface;

  if (type.isBasic) {
    name = logger.prompt('$question Enter the name of the bloc:');

    return (
      interface: interface,
      singular: name,
      plural: makePlural(name),
    );
  }

  final result = logger.prompt('$question Enter the name of the model:');

  name = verifyChanges(
    one: result,
    two: makeSingular(result),
    purpose: 'to be singular',
    logger: logger,
  );

  final proposedInterface = makePlural(name);

  final interfaceResult = logger.prompt(
    '$question Enter the name of the repo:',
    defaultValue: proposedInterface,
  );

  interface = verifyChanges(
    one: interfaceResult,
    two: makePlural(interfaceResult),
    purpose: 'to be plural',
    logger: logger,
  );

  return (
    interface: interface,
    singular: name,
    plural: makePlural(name),
  );
}
