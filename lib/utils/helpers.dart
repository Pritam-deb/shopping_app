class Helper {
  String getName(String fullName) {
    return fullName.substring(0, fullName.indexOf('['));
  }
}
