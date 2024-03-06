abstract class Failure {
  final Map<String, dynamic> map;

  const Failure(this.map);

  static const String key = "failure_message";

  static Map<String, String> error(String message) => {key: message};
}

class LocalFailure extends Failure {
  const LocalFailure(super.map);
}

class ServerFailure extends Failure {
  const ServerFailure(super.map);

  factory ServerFailure.fromJson(Map<String, dynamic> json) {
    try {
      if (json.runtimeType == String) {
        return ServerFailure(Failure.error(json.toString()));
      } else if (json.containsKey("message")) {
        return ServerFailure(Failure.error(json['message']));
      } else if (json.containsKey("msg")) {
        return ServerFailure(Failure.error(json['msg']));
      } else if (json.containsKey("error")) {
        return ServerFailure(Failure.error(json['error']));
      } else {
        List<String> errors = [];

        var j = Map<String, dynamic>.from(json);
        var temp = j
            .map((key, value) => MapEntry(key, List<String>.from(value)))
            .values;

        for (var element in temp) {
          errors.addAll(element);
        }
        String message = "";
        for (var e in errors) {
          message += "$e\n";
        }

        return ServerFailure(Failure.error(message.trim()));
      }
    } catch (e) {
      return ServerFailure(Failure.error(e.toString()));
    }
  }
}
