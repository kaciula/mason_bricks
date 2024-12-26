import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:{{ projectName.snakeCase() }}/app/app_messenger.dart';
import 'package:{{ projectName.snakeCase() }}/app/app_navigator.dart';
import 'package:{{ projectName.snakeCase() }}/app/cubit/app_cubit.dart';
import 'package:{{ projectName.snakeCase() }}/features/common/data/local/app_info_store.dart';
{{#useHive}}import 'package:{{ projectName.snakeCase() }}/features/common/data/local/secure_store.dart';
import 'package:{{ projectName.snakeCase() }}/features/common/data/local/local_store.dart';{{/useHive}}
{{#useDio}}import 'package:{{ projectName.snakeCase() }}/features/common/data/remote/remote_data_store.dart';{{/useDio}}
{{#useFirebase}}import 'package:{{ projectName.snakeCase() }}/services/custom/firebase/fire_service.dart';{{/useFirebase}}
import 'package:{{ projectName.snakeCase() }}/services/generic/crash/crash_service.dart';
import 'package:{{ projectName.snakeCase() }}/services/generic/file_storage_service.dart';
import 'package:{{ projectName.snakeCase() }}/services/generic/log_service.dart';

GetIt getIt = GetIt.instance;

Future<void> registerInstances() async {
  final AppInfoStore appInfoStore = AppInfoStore();
  getIt.registerSingleton<AppInfoStore>(appInfoStore);
  await appInfoStore.init();

  {{#useFirebase}}final FireService fireService = FireService();
  getIt.registerSingleton(fireService);
  await fireService.init();{{/useFirebase}}

  final CrashService crashService = CrashService();
  getIt.registerSingleton(crashService);
  await crashService.init();

  final FileStorageService fileStorageService = FileStorageService();
  getIt.registerSingleton(fileStorageService);
  await fileStorageService.init();

  final LogService logService =
      LogService(crashService, fileStorageService, appInfoStore);
  getIt.registerSingleton(logService);
  await logService.init();

  {{#useHive}}final SecureStore secureStore = SecureStore();
  getIt.registerSingleton(secureStore);
  final LocalStore localStore = LocalStore(secureStore);
  getIt.registerSingleton(localStore);
  final AppInfo appInfo = await appInfoStore.get();
  await localStore.init(isFirstTime: appInfo.isFirstTime);{{/useHive}}

  getIt.registerSingleton(RouteObserver());
  getIt.registerSingleton(AppMessenger());
  getIt.registerSingleton(AppNavigator());

  {{#useDio}}getIt.registerSingleton(
      RemoteDataStore(crashService, logService, appInfoStore));{{/useDio}}

  // Keep this at the end because it gets other dependencies injected into it
  getIt.registerSingleton(AppCubit());
}
