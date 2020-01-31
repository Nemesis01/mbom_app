class StringFormatter {
  static String capitalize(String entry) {
    entry.toLowerCase();
    return "${entry[0].toUpperCase()}${entry.substring(1)}";
  }
}
