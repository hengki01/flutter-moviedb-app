String timeConverter(int value) {
  final int hour = value ~/ 60;
  final int minutes = value % 60;

  return '${hour.toString()} hour(s) ${minutes.toString()} minutes';
}