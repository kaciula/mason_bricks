extension StringExt on String {
  bool containsIgnoreCase(String value) {
    return toLowerCase().contains(value.toLowerCase());
  }

  bool startsAWordWithIgnoreCase(String value) {
    return toLowerCase().startsWith(value.toLowerCase()) ||
        containsIgnoreCase(' $value');
  }

  String capitalizeFirst() {
    if (isNotEmpty) {
      return '${this[0].toUpperCase()}${length > 1 ? substring(1).toLowerCase() : ''}';
    }
    return '';
  }
}
