import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fresher_demo_1/data/services/encryption_service.dart';
import 'package:fresher_demo_1/data/services/storage_service.dart';
import 'package:fresher_demo_1/firebase_options.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'routes/app_pages.dart';
import 'routes/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    if (Firebase.apps.isEmpty) {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
    }
  } catch (e) {
    debugPrint("Firebase already initialized: $e");
  }
  
  final storageService = StorageService();
  await storageService.init();

  final encryption = EncryptionService();
  String correctHash = await encryption.hashWithPBKDF2("123456", "xyz123abc");
  debugPrint("---------------------------------");
  debugPrint("COPY MÃ NÀY DÁN VÀO FIREBASE TRƯỜNG passwordHash: $correctHash");
  debugPrint("---------------------------------");

  String startRoute = Routes.login;
  if (storageService.getSession() != null) {
    startRoute = Routes.home;
  }

  runApp(MyApp(
    initialRoute: startRoute,
  ));
}

class MyApp extends StatelessWidget {
  final String initialRoute;
  const MyApp({super.key, required this.initialRoute});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.nunitoSansTextTheme(),
      ),
      initialRoute: initialRoute,
      getPages: AppPages.routes,
    );
  }
}
