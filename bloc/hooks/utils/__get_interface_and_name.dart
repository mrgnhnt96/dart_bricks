part of '../pre_gen.dart';

({
  String? interface,
  String singular,
  String plural,
}) getInterfaceAndName(Types type, Logger logger) {
  String name;
  String? plural;
  String? interface;

  if (type.isBasic) {
    name = logger.prompt('$question Enter the name of the bloc:');

    return (
      interface: interface,
      singular: name,
      plural: name,
    );
  }

  name = logger.prompt('$question Enter the name of the model (Singular):');

  plural = makePlural(name);

  plural = logger.prompt(
    '$question Enter the name of the model (Plural):',
    defaultValue: plural,
  );

  interface = logger.prompt(
    '$question Enter the name of the repo:',
    defaultValue: plural,
  );

  return (
    interface: interface,
    singular: name,
    plural: plural,
  );
}
