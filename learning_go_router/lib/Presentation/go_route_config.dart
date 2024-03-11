import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:learning_go_router/BusinessLogic/AuthCubit/auth_cubit.dart';
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

class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _shellNavigatorKey = GlobalKey<NavigatorState>();

  static final AuthCubit authCubit = AuthCubit();

  static final router = GoRouter(
    initialLocation: '/login',
      navigatorKey: _rootNavigatorKey,
      routes: [
        //? BASE ROUTE______________________________________________

        //? SHELL ROUTE
        StatefulShellRoute.indexedStack(
            builder: (context, state, navigationShell) {
              // print("H O M E   S H E L L");
              return HomePageMain(shell: navigationShell);
            },
            branches: [
              StatefulShellBranch(routes: [
                GoRoute(
                    path: '/',
                    builder: (context, state) => const HomePage(),
                    routes: [
                      GoRoute(
                          path: 'profile/:id',
                          parentNavigatorKey: _rootNavigatorKey,
                          builder: (context, state) {
                            final String id = state.pathParameters['id']!;
                            final User user = state.extra as User;
                            return ProfilePage(
                              id: id,
                              user: user,
                            );
                          }),
                    ]),
              ]),
              StatefulShellBranch(routes: [
                GoRoute(
                  path: '/home2',
                  builder: (context, state) => const SecondHomePage(),
                ),
              ]),
              StatefulShellBranch(routes: [
                GoRoute(
                  path: '/home3',
                  builder: (context, state) => const ThirdHomePage(),
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
      redirect: (context, state) {
        print("M A T C H E D   L O C A T I O N: ${state.matchedLocation},");

        if (state.matchedLocation == '/login') {
          print("here");

          if (authCubit.state is AuthLogednIn) {
            print("here2");
            print("REDIRECTING TO HOME");
            return '/home1';
          }
        }

        return state.matchedLocation;
      },
      debugLogDiagnostics: true);
}
