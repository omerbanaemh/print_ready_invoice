import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:print_ready_invoice/core/utils/app_them.dart';
import 'package:print_ready_invoice/features/invoice/models/product_details_model.dart';
import 'package:print_ready_invoice/features/invoice/presentation/manger/cubit/clinet_cubit.dart';
import 'package:print_ready_invoice/features/invoice/presentation/manger/cubit/invoice_cubit.dart';
import 'package:print_ready_invoice/features/invoice/presentation/manger/cubit/localization_cubit.dart';
import 'package:print_ready_invoice/features/invoice/presentation/views/invoice_view.dart';
import 'package:print_ready_invoice/generated/l10n.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: AppTheme.lightTheme(context),
      dark: AppTheme.darkTheme(context),
      initial: AdaptiveThemeMode.light,
      builder: (theme, darkTheme) => 
      MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ClinetCubit()),
        BlocProvider(create: (context) => LocalizationCubit(),),
        BlocProvider(
          create: (context) => InvoiceCubit()..loadInitial(),
        ),
      ],
        
        child: BlocBuilder<LocalizationCubit, LocalizationState>(
          builder: (context, state) {
            return MaterialApp(
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

              home: InvoiceView(productDetails: ProductDetailsModel(name: 'name', type: 'type', frameWork: 'frameWork', technologies:[ 'technologies'], description: 'description'),),
              // home: ProjectDetails(),
            );
          },
        ),
      ),
    );
  }
}
