String makePlural(String word) {
  final pluralPattern = RegExp(
    r'\b\w+(?<![^s]s|es|\w*[^aeiou]ies)\b',
    caseSensitive: false,
  );

  final pluralForm = word.replaceAllMapped(pluralPattern, (match) {
    final matchedWord = match.group(0)!;

    if (matchedWord.endsWith('y')) {
      return matchedWord.substring(0, matchedWord.length - 1) + 'ies';
    }

    if (matchedWord.endsWith('s') ||
        matchedWord.endsWith('x') ||
        matchedWord.endsWith('z') ||
        matchedWord.endsWith('ch') ||
        matchedWord.endsWith('sh')) {
      return matchedWord + 'es';
    }

    if (matchedWord.endsWith('o') && !matchedWord.endsWith('eo')) {
      return matchedWord + 'es';
    }

    if (matchedWord.endsWith('fe')) {
      return matchedWord.substring(0, matchedWord.length - 2) + 'ves';
    }

    if (matchedWord.endsWith('f')) {
      return matchedWord.substring(0, matchedWord.length - 1) + 'ves';
    }

    if (matchedWord.endsWith('us')) {
      return matchedWord.substring(0, matchedWord.length - 2) + 'i';
    }

    return matchedWord + 's';
  });

  return pluralForm;
}
