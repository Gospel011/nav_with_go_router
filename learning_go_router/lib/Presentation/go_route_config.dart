import 'package:go_router/go_router.dart';
import 'package:learning_go_router/Presentation/pages/forgot_password.dart';
import 'package:learning_go_router/Presentation/pages/home_page.dart';
import 'package:learning_go_router/Presentation/pages/login.dart';
import 'package:learning_go_router/Presentation/pages/profile_page.dart';
import 'package:learning_go_router/Presentation/pages/signup.dart';
import 'package:learning_go_router/Presentation/pages/verify_email_page.dart';

final router = GoRouter(
  initialLocation: '/login',
  routes: [
  //? BASE ROUTE
  GoRoute(
      path: '/',
      builder: (context, state) {
        print("Home page from go router");
        return const HomePage();
      },

      //* profile sub-class
      routes: [
        GoRoute(
            path: 'profile',
            builder: (context, state) {
              return const ProfilePage();
            })
      ]),

  //? LOGIN
  GoRoute(
    path: '/login',
    builder: ((context, state) => const LoginPage()),
    routes: [
    //* signup
    GoRoute(path: 'signup', builder: (context, state) => const SignupPage()),

    //*forgot password
    GoRoute(path: 'forgot-password', builder: (context, state) => const ForgotPasswordPage())
  ]),

  //? EMAIL VERIFICATION
  GoRoute(path: '/verify-email', builder: (context, state) => const VerifyEmailPage()),

  //?
], debugLogDiagnostics: true);
