import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/configs/theme/app_theme.dart';
import 'core/services/service_locator.dart';
import 'core/utils/app_router.dart';
import 'presentation/choose_mode/cubits/theme_mode_cubit/theme_mode_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: kIsWeb
          ? HydratedStorage.webStorageDirectory
          : await getApplicationDocumentsDirectory());
  await initDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ThemeModeCubit(),
        ),
      ],
      child: BlocBuilder<ThemeModeCubit, ThemeMode>(
        builder: (context, mode) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'Spotify Clone',
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: mode,
            routerConfig: AppRouter.router,
          );
        },
      ),
    );
  }
}
