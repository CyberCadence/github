//For captilizing first letter
extension StringExtension on String {
  String capitalizee() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}
