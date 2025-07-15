import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:print_ready_invoice/core/utils/app_router.dart';
import 'package:print_ready_invoice/core/utils/app_them.dart';
import 'package:print_ready_invoice/core/utils/bloc_observer.dart';
import 'package:print_ready_invoice/core/utils/functions/setup_service_locator.dart';
import 'package:print_ready_invoice/features/invoice/data/data_sources/client_local_data_source.dart';
import 'package:print_ready_invoice/features/invoice/data/repos/client_repo_impl.dart';
import 'package:print_ready_invoice/features/invoice/domin/use_cases/fetch_client_details_use_case.dart';
import 'package:print_ready_invoice/features/invoice/presentation/manger/cubit/client_details_cubit/clinet_cubit.dart';
import 'package:print_ready_invoice/features/invoice/presentation/manger/cubit/invoice_cubit.dart';
import 'package:print_ready_invoice/features/invoice/presentation/manger/cubit/localization_cubit.dart';
import 'package:print_ready_invoice/firebase_options.dart';
import 'package:print_ready_invoice/generated/l10n.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ClientCubit(FetchClientDetailsUseCase(clinetRepo: getIt.get<ClientRepoImpl>()))..fetchClientDetails()),
        BlocProvider(create: (context) => LocalizationCubit()),
        BlocProvider(create: (context) => InvoiceCubit()),
      ],

      child: BlocBuilder<LocalizationCubit, LocalizationState>(
        builder: (context, state) {
          return AdaptiveTheme(
            light: AppTheme.lightTheme(context),
            dark: AppTheme.darkTheme(context),
            initial: AdaptiveThemeMode.light,
            builder: (theme, darkTheme) {
              return MaterialApp.router(
                routerConfig: AppRouter.router,
                debugShowCheckedModeBanner: false,
                title: 'Flutter Demo',
                theme: theme,
                darkTheme: darkTheme,
                locale: Locale(
                  state is LocalizationChanged ? state.locale : 'en',
                ),
                localizationsDelegates: const [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: S.delegate.supportedLocales,
              );
            },
          );
        },
      ),
    );
  }
}
