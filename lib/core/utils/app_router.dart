import 'package:go_router/go_router.dart';

import '../../domain/entities/home/song/song_entity.dart';
import '../../presentation/auth/views/login_view.dart';
import '../../presentation/auth/views/register_view.dart';
import '../../presentation/auth/views/signup_or_signin_view.dart';
import '../../presentation/choose_mode/views/choose_mode_view.dart';
import '../../presentation/get_started/views/get_started_view.dart';
import '../../presentation/home/views/home_view.dart';
import '../../presentation/profile/views/profile_view.dart';
import '../../presentation/song_player/views/song_player_view.dart';
import '../../presentation/splash/views/splash_view.dart';

class AppRouter {
  static const kGetStartedView = '/getStartedView';
  static const kChooseModelView = '/chooseModeView';
  static const kSignupOrSignInView = '/signupOrSignInView';
  static const kLoginView = '/loginView';
  static const kRegisterView = '/registerView';
  static const kHomeView = '/homeView';
  static const kSongPlayerView = '/songPlayerView';
  static const kProfileView = '/profileView';
  static final router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: kGetStartedView,
      builder: (context, state) => const GetStartedView(),
    ),
    GoRoute(
      path: kChooseModelView,
      builder: (context, state) => const ChooseModeView(),
    ),
    GoRoute(
      path: kSignupOrSignInView,
      builder: (context, state) => const SignupOrSigninView(),
    ),
    GoRoute(
      path: kRegisterView,
      builder: (context, state) => const RegisterView(),
    ),
    GoRoute(
      path: kLoginView,
      builder: (context, state) => const LoginView(),
    ),
    GoRoute(
      path: kHomeView,
      builder: (context, state) => const HomeView(),
    ),
    GoRoute(
      path: kSongPlayerView,
      builder: (context, state) => SongPlayerView(
        song: state.extra as SongEntity,
      ),
    ),
    GoRoute(
      path: kProfileView,
      builder: (context, state) => const ProfileView(),
    ),
  ]);
}
