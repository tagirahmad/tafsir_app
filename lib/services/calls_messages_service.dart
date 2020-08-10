// Package imports:
import 'package:url_launcher/url_launcher.dart';

String params(String email) {
  return Uri(
    scheme: 'mailto',
    path: email,
    query: 'subject=Tafsir app',
  ).toString();
}

class CallsAndMessagesService {
  String email = params.toString();

  void call(String number) => launch('tel:$number');
  void sendSms(String number) => launch('sms:$number');
  void sendEmail(String email) => launch(params(email));
}
