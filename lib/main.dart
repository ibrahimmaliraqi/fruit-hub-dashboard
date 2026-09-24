import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fruit_hub_dashboard/core/router/app_router.dart';
import 'package:fruit_hub_dashboard/core/services/bloc_observer.dart';
import 'package:fruit_hub_dashboard/core/services/server_locator.dart';
import 'package:fruit_hub_dashboard/features/add_product/domain/usecases/add_product_usecase.dart';
import 'package:fruit_hub_dashboard/features/add_product/presentation/manager/add_product/add_product_cubit.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Supabase.initialize(
    url: 'https://rhonlvjgthnfcimynjxb.supabase.co',
    publishableKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJob25sdmpndGhuZmNpbXluanhiIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc5MDA2ODE4MiwiZXhwIjoyMTA1NjQ0MTgyfQ._JAi1CgMpZb3AzYq9jd9EM6rThDQCe7py-szeGM09eY',
  );
  setupLocator();
  Bloc.observer = AppBlocObserver();

  runApp(const MyApp());
}

final supabase = Supabase.instance.client;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AddProductCubit(
            addProductUseCase: getIt.get<AddProductUseCase>(),
          ),
        ),
      ],
      child: MaterialApp.router(
        locale: Locale("ar"),
        localizationsDelegates: GlobalMaterialLocalizations.delegates,
        supportedLocales: [
          Locale('en'), // English
          Locale('ar'), // Spanish
        ],
        theme: ThemeData(
          fontFamily: 'Cairo',
        ),
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
        title: 'fruit hub dashboard',
      ),
    );
  }
}
