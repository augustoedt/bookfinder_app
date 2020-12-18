import 'package:book_finder/models/user.dart';

abstract class LoginManager{
  Future<void> login();
  Future<void> disconnect();
}