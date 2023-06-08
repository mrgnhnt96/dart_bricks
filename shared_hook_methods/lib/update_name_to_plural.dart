part of '../pre_gen.dart';

String updateNameToPlural(String name) {
  return name.replaceAll(RegExp(r'[^aeiou]s$'), '');
}
