import 'package:flutter_dotenv/flutter_dotenv.dart';

class Constants {
  static final baseUrl = dotenv.env['BASE_URL']!;
}
