import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static initEnvironment() async {
    await dotenv.load(fileName: ".env");
  }

  static String apiRest =
      dotenv.env["API_REST"] ?? "No está configurado el API_REST";
  static String accesKey =
      dotenv.env["ACCESS_KEY"] ?? "No está configurado el ACCESS_KEY";
}
