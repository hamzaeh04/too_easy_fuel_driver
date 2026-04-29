import 'package:get/get.dart';
import 'package:too_easy_fuel_driver/features/home/controller/home_controller.dart';
import 'package:too_easy_fuel_driver/features/home/views/on_way_screen.dart';
import 'package:too_easy_fuel_driver/features/mileage/binding/mileage_binding.dart';
import 'package:too_easy_fuel_driver/features/mileage/views/mileage_screen.dart';


import '../../features/auth/binding/auth_binding.dart';
import '../../features/auth/views/forgot_email_screen.dart';
import '../../features/auth/views/forgot_set_password.dart';
import '../../features/auth/views/login_screen.dart';
import '../../features/auth/views/otp_verification.dart';
import '../../features/auth/views/signup_screen.dart';
import '../../features/home/binding/home_binding.dart';
import '../../features/home/views/fueling_screen.dart';
import '../../features/home/views/home_screen.dart';
import '../../features/home/views/job_detail_screen.dart';
import '../../features/home/views/job_started_screen.dart';
import '../../features/navbar/binding/navbar_binding.dart';
import '../../features/navbar/views/navbar_screen.dart';
import '../../features/notification/binding/notification_binding.dart';
import '../../features/notification/views/notification_screen.dart';
import '../../features/onboarding/binding/onboarding_binding.dart';
import '../../features/onboarding/views/onboarding_one.dart';
import '../../features/profile/binding/profile_binding.dart';
import '../../features/profile/views/change_password.dart';
import '../../features/profile/views/edit_profile.dart';
import '../../features/profile/views/notification_setting.dart';
import '../../features/profile/views/profile_screen.dart';
import '../../features/setting/binding/setting_binding.dart';
import '../../features/setting/views/aboutus_screen.dart';
import '../../features/setting/views/faqs_screen.dart';
import '../../features/setting/views/setting_screen.dart';
import '../../features/setting/views/support_screen.dart';
import '../../features/setting/views/terms_screen.dart';
import '../../features/splash/binding/splash_binding.dart';
import '../../features/splash/views/splash_screen.dart';

class AppRoutes {
  static List<GetPage<dynamic>> routes = [
    GetPage(name: '/', page: () => SplashScreen(),binding: SplashBinding()),
    GetPage(name: '/onboardingone', page: () => OnboardingOne(),binding: OnboardingBinding()),
    GetPage(name: '/helpsupport', page: () => SettingScreen(),binding: SettingBinding()),
    GetPage(name: '/aboutus', page: () => AboutUsScreen(),binding: SettingBinding()),
    GetPage(name: '/support', page: () => SupportScreen(),binding: SettingBinding()),
    GetPage(name: '/terms', page: () => TermsScreen(),binding: SettingBinding()),
    GetPage(name: '/faqs', page: () => FaqsScreen(),binding: SettingBinding()),
    GetPage(name: '/notifications', page: () => NotificationScreen(),binding: NotificationBinding()),
    GetPage(name: '/signup', page: () => SignupScreen(),binding: AuthBinding()),
    GetPage(name: '/otp', page: () => OtpVerification(),binding: AuthBinding()),
    GetPage(name: '/login', page: () => LoginScreen(),binding: AuthBinding()),
    GetPage(name: '/email', page: () => EnterEmailScreen(),binding: AuthBinding()),
    GetPage(name: '/forgotsetpassword', page: () => ForgotSetPassword(),binding: AuthBinding()),
    GetPage(name: '/profile', page: () => ProfileScreen(),binding: ProfileBinding()),
    GetPage(name: '/editprofile', page: () => EditProfileScreen(),binding: ProfileBinding()),
    GetPage(name: '/changePassword', page: () => ChangePasswordScreen(),binding: ProfileBinding()),
    GetPage(name: '/notificationSetting', page: () => NotificationSettingScreen(),binding: ProfileBinding()),
    GetPage(name: '/mileage', page: () => MileageScreen(),binding: MileageBinding()),
    GetPage(name: '/home', page: () => HomeScreen(),binding: HomeBinding()),
    GetPage(name: '/navbar', page: () => NavbarScreen(),binding: NavbarBinding()),
    GetPage(name: '/jobdetail', page: () => JobDetailScreen(),binding: HomeBinding()),
    GetPage(name: '/jobstarted', page: () => JobStartedScreen(),binding: HomeBinding()),
    GetPage(name: '/onway', page: () => OnWayScreen(),binding: HomeBinding()),
    GetPage(name: '/fueling', page: () => FuelingScreen(),binding: HomeBinding()),

  ];
}
