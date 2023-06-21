part of '../pre_gen.dart';

({String? interface, String singular, String plural}) getInterfaceAndName(
  Logger logger, {
  required bool isInterface,
}) {
  String name;
  String? plural;
  String? interface;

  name = logger.prompt(
      '$question Enter the name of the model${isInterface ? ' (Singular)' : ''}:');

  if (isInterface) {
    plural = makePlural(name);

    plural = logger.prompt(
      '$question Enter the name of the model (Plural):',
      defaultValue: plural,
    );

    interface = logger.prompt(
      '$question Enter the name of the interface:',
      defaultValue: plural,
    );
  }

  return (interface: interface, singular: name, plural: plural ?? name);
}
