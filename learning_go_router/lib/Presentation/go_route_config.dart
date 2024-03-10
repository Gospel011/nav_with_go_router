import 'package:go_router/go_router.dart';
import 'package:learning_go_router/Models/user_model.dart';
import 'package:learning_go_router/Presentation/pages/forgot_password.dart';
import 'package:learning_go_router/Presentation/pages/home_pages/home_page.dart';
import 'package:learning_go_router/Presentation/pages/home_pages/home_page_main.dart';
import 'package:learning_go_router/Presentation/pages/home_pages/second_home_page.dart';
import 'package:learning_go_router/Presentation/pages/home_pages/third_home_page.dart';
import 'package:learning_go_router/Presentation/pages/login.dart';
import 'package:learning_go_router/Presentation/pages/profile_page.dart';
import 'package:learning_go_router/Presentation/pages/signup.dart';
import 'package:learning_go_router/Presentation/pages/verify_email_page.dart';

final router = GoRouter(
    initialLocation: '/login',
    routes: [
      //? BASE ROUTE______________________________________________
      GoRoute(
          path: 'profile/:id',
          builder: (context, state) {
            final String id = state.pathParameters['id']!;
            final User user = state.extra as User;
            return ProfilePage(
              id: id,
              user: user,
            );
          }),

      //? SHELL ROUTE
      StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) {
            return HomePageMain(shell: navigationShell);
          },
          branches: [
            StatefulShellBranch(routes: [
              GoRoute(
                path: '/home1',
                builder: (context, state) => HomePage(),
              ),
            ]),
            StatefulShellBranch(routes: [
              GoRoute(
                path: '/home2',
                builder: (context, state) => SecondHomePage(),
              ),
            ]),
            StatefulShellBranch(routes: [
              GoRoute(
                path: '/home3',
                builder: (context, state) => ThirdHomePage(),
              ),
            ])
          ]),

      //? LOGIN_______________________________________________________
      GoRoute(
          path: '/login',
          builder: ((context, state) => const LoginPage()),
          routes: [
            //* signup
            GoRoute(
                path: 'signup',
                builder: (context, state) => const SignupPage()),

            //*forgot password
            GoRoute(
                path: 'forgot-password',
                builder: (context, state) => const ForgotPasswordPage())
          ]),

      //? EMAIL VERIFICATION____________________________________________
      GoRoute(
          path: '/verify-email',
          builder: (context, state) => const VerifyEmailPage()),

      //?
    ],
    debugLogDiagnostics: true);
