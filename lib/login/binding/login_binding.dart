import 'package:fresher_demo_1/data/repositories/auth_repository.dart';
import 'package:fresher_demo_1/data/services/encryption_service.dart';
import 'package:fresher_demo_1/data/services/storage_service.dart';
import 'package:get/get.dart';

import '../controller/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StorageService());
    Get.lazyPut(() => EncryptionService());
    Get.lazyPut(() => AuthRepository());
    Get.lazyPut<LoginController>(() => LoginController());
  }
}
