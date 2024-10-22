import 'package:auto_localized/auto_localized.dart';
import 'package:{{ projectName.snakeCase() }}/app/app_strings.al.dart';
import 'package:{{ projectName.snakeCase() }}/app/app_styles.dart';
import 'package:{{ projectName.snakeCase() }}/features/common/pages/splash/cubit/splash_cubit.dart';
import 'package:{{ projectName.snakeCase() }}/features/common/pages/splash/splash_page.dart';
import 'package:{{ projectName.snakeCase() }}/features/common/ui/generic/utils/build_context_extension.dart';
import 'package:{{ projectName.snakeCase() }}/features/common/ui/semi_custom/plain_container.dart';
import 'package:{{ projectName.snakeCase() }}/start/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logging/logging.dart';
import 'package:universal_io/io.dart';

import 'app_messenger.dart';
import 'app_navigator.dart';
import 'app_routes.dart';
import 'cubit/app_cubit.dart';
import 'cubit/app_state.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  MainAppState createState() => MainAppState();
}

class MainAppState extends State<MainApp> {
  final AppCubit _appCubit = getIt<AppCubit>();
  final AppNavigator _appNavigator = getIt<AppNavigator>();
  final AppMessenger _appMessenger = getIt<AppMessenger>();
  final RouteObserver _routeObserver = getIt<RouteObserver>();

  @override
  Widget build(BuildContext context) {
    return AutoLocalizedApp(
      child: BlocProvider<AppCubit>(
        create: (BuildContext context) => _appCubit,
        child: BlocBuilder<AppCubit, AppState>(
          bloc: _appCubit,
          builder: (BuildContext context, AppState state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'sample',
              supportedLocales: context.supportedLocales,
              localizationsDelegates: context.localizationsDelegates,
              builder: (BuildContext context, Widget? child) {
                final Size deviceSize = MediaQuery.of(context).size;
                _logger.fine(
                    'Device size ${deviceSize.width} x ${deviceSize.height}');
                _appCubit
                    .scaleFactorUpdated(_responsiveScaleFactor(deviceSize));
                return MediaQuery(
                  data: MediaQuery.of(context).copyWith(
                    textScaler: TextScaler.linear(
                      _responsiveTextScaleFactor(deviceSize),
                    ),
                  ),
                  child: PlainContainer(
                    decoration: BoxDecoration(
                      color: AppColors.white,
                    ),
                    padding: _responsiveSidePadding(deviceSize),
                    child: AppDelegate(child: child),
                  ),
                );
              },
              home: BlocProvider<SplashCubit>(
                create: (BuildContext context) => SplashCubit()..appStarted(),
                child: SplashPage(),
              ),
              theme: state.appTheme.themeData,
              darkTheme: state.appTheme.darkThemeData,
              themeMode: state.appTheme.themeMode,
              navigatorKey: _appNavigator.globalNavigatorKey,
              navigatorObservers: <NavigatorObserver>[_routeObserver],
              scaffoldMessengerKey: _appMessenger.messengerKey,
              onGenerateRoute: (RouteSettings settings) =>
                  appRoutes(settings, _appCubit),
            );
          },
        ),
      ),
    );
  }

  double _responsiveTextScaleFactor(Size deviceSize) {
    if (deviceSize.width >= 950 && deviceSize.height >= 950) {
      return 2;
    }
    if (deviceSize.width >= 600 && deviceSize.height >= 600) {
      return 1.5;
    }
    return 1;
  }

  double _responsiveScaleFactor(Size deviceSize) {
    if (deviceSize.width >= 950 && deviceSize.height >= 950) {
      return 1.8;
    }
    if (deviceSize.width >= 600 && deviceSize.height >= 600) {
      return 1.5;
    }
    return 1;
  }

  EdgeInsets _responsiveSidePadding(Size deviceSize) {
    if (deviceSize.width >= 950 && deviceSize.height >= 950) {
      /* return EdgeInsets.symmetric(
        horizontal: 0.1 * deviceSize.width,
        vertical: 0.1 * deviceSize.height,
      ); */
    }
    if (deviceSize.width >= 600 && deviceSize.height >= 600) {
      /* return EdgeInsets.symmetric(
        horizontal: 0.1 * deviceSize.width,
        vertical: 0.1 * deviceSize.height,
      ); */
    }
    return EdgeInsets.zero;
  }
}

class AppDelegate extends StatefulWidget {
  const AppDelegate({super.key, required this.child});

  final Widget? child;

  @override
  AppDelegateState createState() => AppDelegateState();
}

class AppDelegateState extends State<AppDelegate> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _cubit(context).appStarted();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      _logger.fine('app paused');
      _cubit(context).appPaused();
    }
    if (state == AppLifecycleState.resumed) {
      _logger.fine('app resumed');
      _cubit(context).appResumed();
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Dismiss the keyboard when any tap happens outside a TextField
        if (Platform.isIOS) {
          context.hideKeyboard();
        }
      },
      child: widget.child,
    );
  }

  AppCubit _cubit(BuildContext context) => context.read<AppCubit>();
}

// ignore: unused_element
final Logger _logger = Logger('App');
