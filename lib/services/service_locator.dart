import 'package:get_it/get_it.dart';
import 'package:tafsir_albaqara/services/calls_messages_service.dart';

GetIt locator = GetIt();

void setupLocator() {
  locator.registerSingleton(CallsAndMessagesService());
}
