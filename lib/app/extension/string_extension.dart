/*
  String Extensions
*/

extension StringExtension on String {
  bool containsIgnoreCase(String value) {
    // extension method needs to use this.
    // ignore: unnecessary_this
    var target = this.toLowerCase();
    var lowerCaseValue = value.toLowerCase();
    return target.contains(lowerCaseValue);
  }
}