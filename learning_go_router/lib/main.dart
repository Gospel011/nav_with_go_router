import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:learning_go_router/BusinessLogic/AuthCubit/auth_cubit.dart';
import 'package:learning_go_router/Presentation/go_route_config.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  HydratedBloc.storage = await HydratedStorage.build(storageDirectory: await getApplicationDocumentsDirectory());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    final AppRouter appRouter = AppRouter();
    return BlocProvider<AuthCubit>(
      create: (context) => AppRouter.authCubit,
      child: Builder(
        builder: (context) {


          return MaterialApp.router(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              inputDecorationTheme: InputDecorationTheme(
                
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade400), borderRadius: BorderRadius.circular(16)),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade800), borderRadius: BorderRadius.circular(16)),
              ),
              useMaterial3: false,
            ),
            routerConfig: AppRouter.router,
          );
        }
      ),
    );
  }
}
