// ignore_for_file: file_names

class CustomException implements Exception {
  final String? messsage;
  const CustomException({this.messsage = "Something went worng!"});

  @override
  String toString() {
    return "CustomException { message: $messsage }";
  }
}
