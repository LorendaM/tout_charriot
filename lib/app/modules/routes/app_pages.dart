import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:tout_charriot/app/modules/authentification/login/view/login_view.dart';
import 'package:tout_charriot/app/modules/dashboard/home/view/home_view.dart';
import 'package:tout_charriot/app/modules/dashboard/race/view/race_accomplish_view.dart';
import 'package:tout_charriot/app/modules/dashboard/race/view/race_view.dart';
import 'package:tout_charriot/app/modules/dashboard/race/view/race_waitting_view.dart';
import 'package:tout_charriot/app/modules/dashboard/view/dashboard_view.dart';
import 'package:tout_charriot/app/modules/splashscreen/view/splashscreen_view.dart';

import '../authentification/register/view/register_view.dart';
import '../dashboard/race/view/race_progress_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.splashscreen;

  static final routes = [
    GetPage(
      name: _Paths.splashscreen,
      page: () => const SplashscreenView(),
    ),
    GetPage(
      name: _Paths.login,
      page: () => const LoginView(),
    ),
    GetPage(
      name: _Paths.dashboard,
      page: () => DashboardView(),
    ),
    GetPage(
      name: _Paths.home,
      page: () => const HomeView(),
    ),
    GetPage(
      name: _Paths.register,
      page: () => const RegisterView(),
    ),
    GetPage(
      name: _Paths.race,
      page: () => RaceView(),
      children: [
        GetPage(
          name: _Paths.race_waitting,
          page: () => const RaceWaitingView(),
        ),
        GetPage(
          name: _Paths.race_progress,
          page: () => const RaceProgressView(),
        ),
        GetPage(
          name: _Paths.race_accomplish,
          page: () => const RaceAccomplishView(),
        ),
    ]),
  ];
}
