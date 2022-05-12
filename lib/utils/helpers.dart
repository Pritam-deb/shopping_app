class Helper {
  Helper._();
  static final Helper _instance = Helper._();
  factory Helper() => _instance;

  String getName(String fullName) {
    return fullName.substring(0, fullName.indexOf('['));
  }
}
