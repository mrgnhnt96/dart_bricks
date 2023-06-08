String makeSingular(String word) {
  final pluralPattern = RegExp(r'\b\w+(?:s\b|es\b|\w*[^aeiou]ies\b)\b');

  final singularForm = word.replaceAllMapped(pluralPattern, (match) {
    final matchedWord = match.group(0)!;

    if (matchedWord.endsWith('ies')) {
      return matchedWord.substring(0, matchedWord.length - 3) + 'y';
    }

    if (matchedWord.endsWith('es') && !['yes', 'no'].contains(matchedWord)) {
      return matchedWord.substring(0, matchedWord.length - 2);
    }

    if (matchedWord.endsWith('ves')) {
      return matchedWord.substring(0, matchedWord.length - 3) + 'f';
    }

    if (matchedWord.endsWith('xes') ||
        matchedWord.endsWith('zes') ||
        matchedWord.endsWith('ches') ||
        matchedWord.endsWith('shes')) {
      return matchedWord.substring(0, matchedWord.length - 2);
    }

    if (matchedWord.endsWith('men')) {
      return matchedWord.substring(0, matchedWord.length - 2) + 'an';
    }

    if (matchedWord.endsWith('s')) {
      return matchedWord.substring(0, matchedWord.length - 1);
    }

    return matchedWord;
  });

  return singularForm;
}
