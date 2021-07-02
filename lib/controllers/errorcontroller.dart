import 'package:home/services/appexeception.dart';

class ErrorController {
  void handleError(error) {
    if (error is BadRequestException) {
      var message = error.message;
      print(message);
    } else if (error is FetchDataException) {
      var message = error.message;
      print(message);
    } else if (error is ApiNotRespondingException) {
      var message = error.message;
      print(message);
    }
  }
}
