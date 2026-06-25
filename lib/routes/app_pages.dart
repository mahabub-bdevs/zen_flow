import 'package:get/get.dart';
import 'package:zen_flow/features/auth/login/view/forget_password_screen.dart';
import 'package:zen_flow/features/auth/login/view/reset_password_screen.dart';
import 'package:zen_flow/features/auth/login/widgets/email_update_item.dart';
import 'package:zen_flow/features/auth/login/widgets/password_update_item.dart';
import 'package:zen_flow/features/auth/singUp/binding/sing_up_binding.dart';
import 'package:zen_flow/features/auth/singUp/view/sing_up_screen.dart';
import 'package:zen_flow/features/home/view/add_student_information.dart';
import 'package:zen_flow/features/home/view/information_details_screen.dart';
import 'package:zen_flow/features/myInformationList/binding/my_in_list_binding.dart';
import 'package:zen_flow/features/myInformationList/view/my_in_list_details_screen.dart';
import 'package:zen_flow/features/myInformationList/view/my_in_list_screen.dart';
import 'app_routes.dart';

import '../features/splash/view/splash_screen.dart';
import '../features/splash/binding/splash_binding.dart';
import '../features/onboarding/view/onboarding_screen.dart';
import '../features/onboarding/binding/onboarding_binding.dart';
import '../features/auth/login/view/login_screen.dart';
import '../features/auth/login/binding/login_binding.dart';
import '../features/main/view/main_screen.dart';
import '../features/main/binding/main_binding.dart';
import '../features/home/view/home_screen.dart';
import '../features/home/binding/home_binding.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.onboarding,
      page: () => const OnboardingScreen(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginScreen(),
      binding: LoginBinding(),
    ), GetPage(
      name: AppRoutes.resetPassword,
      page: () =>  ResetPasswordScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.singUp,
      page: () => const SingUpScreen(),
      binding: SingUpBinding(),
    ),
    GetPage(
      name: AppRoutes.main,
      page: () => const MainScreen(),
      binding: MainBinding(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => const HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.addStudentInformation,
      page: () => const AddStudentInformation(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.myInListScreen,
      page: () => const MyInListScreen(),
      binding: MyInListBinding(),
    ),
    GetPage(
      name: AppRoutes.informationDetailsScreen,
      page: () => const InformationDetailsScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.myInListDetailsScreen,
      page: () => const MyInListDetailsScreen(),
      binding: MyInListBinding(),
    ),
    GetPage(
      name: AppRoutes.passwordUpdateItem,
      page: () => const PasswordUpdateItem(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.emailUpdateItem,
      page: () => const EmailUpdateItem(),
      binding: LoginBinding(),
    ),GetPage(
      name: AppRoutes.forgotScreen,
      page: () => const ForgetPasswordScreen(),
      binding: LoginBinding(),
    ),
  ];
}
