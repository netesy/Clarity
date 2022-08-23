import 'package:clarity/clarity.dart';

main() {
  var client =
      Clarity("http://server-url", "databaseName", "login", "password");
  client.listDatabases().list();
}
