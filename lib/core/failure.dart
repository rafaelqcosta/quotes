class Failure implements Exception {
  Failure(this.message);
  final String message;
}

class ServerFailure extends Failure {
  ServerFailure(String message) : super(message);
}

class JsonParseFailure extends Failure {
  JsonParseFailure({message = 'Error trying to convert json data.'}) : super(message);
}
