class Helper {
  const Helper._();
  static String formatDisplayTime(Duration time) {
    return time.toString().substring(2, 10);
  }
}
