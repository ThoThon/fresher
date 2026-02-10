import 'package:fresher_demo_1/home/binding/home_binding.dart';
import 'package:fresher_demo_1/home/ui/home_screen.dart';
import 'package:fresher_demo_1/login/binding/login_binding.dart';
import 'package:fresher_demo_1/login/ui/login_screen.dart';
import 'package:fresher_demo_1/routes/app_routes.dart';
import 'package:get/get.dart';

class AppPages {
  static List<GetPage> routes = [
    GetPage(
      name: Routes.login,
      page: () => const LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.home,
      page: () => const HomeScreen(),
      binding: HomeBinding(),
    ),
  ];
}
