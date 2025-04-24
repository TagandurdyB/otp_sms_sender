import 'config/core/exports.dart';
import 'config/themes/my_theme.dart';
import 'injector.dart';

void run() {
  runApp(
    const Injector(MyApp()),
    // DevicePreview(
    //   enabled: true,
    //   builder: (context) => const Injector(MyApp()),
    // ),
  );
}

Future<void> initDependencies() async {
  await Boxes.init();
  await DeviceService.initPlatformState();
  await FirebaseService().init();
  await SmsSenderBgService.requestPermission();
  await MobileNumberService.initMobileNumberState();
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  run();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints) =>
            OrientationBuilder(builder: (context, orientation) {
              context.read<ResponsiveCubit>().changeValues(
                    constraints: constraints,
                    orientation: orientation,
                  );
              return LifecycleManager(
                child: MaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: 'OTP sms dender',
                  themeMode: ThemeMode.dark, //ThemeCubit.of(context).mode,
                  theme: MyTheme.light,
                  darkTheme: MyTheme.dark,
                  onGenerateRoute: AppRoute.onGenerateRoute,
                  navigatorKey: AppRoute.mainNavKey,
                ),
              );
            }));
  }
}
