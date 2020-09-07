import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartsurveys/models/CommunityAPI.dart';
import 'package:smartsurveys/ui/CommunityPage.dart';
import 'package:smartsurveys/ui/HomePage.dart';
import 'package:smartsurveys/ui/LoginPage.dart';
import 'package:smartsurveys/Storage.dart';
import 'package:smartsurveys/data/LocalKeyValuePersistence.dart';
import 'package:smartsurveys/models/SurveyApp.dart';
import 'package:smartsurveys/models/SurveyGroup.dart';
import 'package:smartsurveys/my_constants.dart';
import 'package:smartsurveys/ui/NewFamilyPage.dart';
import 'package:smartsurveys/ui/RegisterPage.dart';
import 'package:smartsurveys/ui/SurveyGroupPage.dart';
import 'package:smartsurveys/ui/SurveyMetricPage.dart';
import 'package:smartsurveys/ui/SurveyPage.dart';

void main() {
  runApp(MyConstants(
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  static var provider = SurveyApp(null, null);

  MaterialColor createMaterialColor(Color color) {
    List strengths = <double>[.05];
    Map swatch = <int, Color>{};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    strengths.forEach((strength) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    });
    return MaterialColor(color.value, swatch);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Storage>(
        future: Storage.create(
          repository: LocalKeyValuePersistence(),
        ),
        builder: (context, snapshot) {
          final repository = snapshot.data;
          provider = SurveyApp(null, repository);
          return MultiProvider(
            providers: [ChangeNotifierProvider.value(value: provider)],
            child: MaterialApp(
              title: 'Smart Survey',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                  primarySwatch: createMaterialColor(Color(0xFFF16a00)),
                  fontFamily: 'Consolas'),
              home: _checkLogin(),
              onGenerateRoute: (settings) {
                return MaterialPageRoute(
                  builder: (context) {
                    return _makeRoute(
                        context: context,
                        routeName: settings.name,
                        arguments: settings.arguments);
                  },
                  maintainState: true,
                  fullscreenDialog: false,
                );
              },
            ),
          );
        });
  }

  Widget _checkLogin() {
    if (provider.user == null) {
      return LoginPage();
    }
    return (provider.user.activation == 1) ? HomePage() : RegisterPage();
  }

  Widget _makeRoute(
      {@required BuildContext context,
      @required String routeName,
      Object arguments}) {
    final Widget child = _buildRoute(
      context: context,
      routeName: routeName,
      arguments: arguments,
    );
    return child;
  }

  Widget _buildRoute({
    @required BuildContext context,
    @required String routeName,
    Object arguments,
  }) {
    switch (routeName) {
      case '/login':
        return MultiProvider(
          providers: [
            ChangeNotifierProvider.value(
              value: provider,
            )
          ],
          child: LoginPage(),
        );
      case '/register':
        return MultiProvider(
          providers: [
            ChangeNotifierProvider.value(
              value: provider,
            )
          ],
          child: RegisterPage(),
        );
      case '/home':
        return MultiProvider(
          providers: [
            ChangeNotifierProvider.value(
              value: provider,
            )
          ],
          child: HomePage(),
        );
      case '/community':
        return MultiProvider(
          providers: [
            ChangeNotifierProvider.value(
              value: provider,
            )
          ],
          child: CommunityPage(),
        );
      case '/newfamily':
        final map = arguments as Map<String, dynamic> ?? Map();
        final cm = map['cm'] as CommunityAPI;
        return MultiProvider(
          providers: [
            ChangeNotifierProvider.value(
              value: provider,
            )
          ],
          child: NewFamilyPage(cm: cm),
        );
      case '/surveygroup':
        return MultiProvider(
          providers: [
            ChangeNotifierProvider.value(
              value: provider,
            )
          ],
          child: SurveyGroupPage(),
        );
      case '/surveymetric':
        final map = arguments as Map<String, dynamic> ?? Map();
        final sg = map['sg'] as SurveyGroup;

        return MultiProvider(
          providers: [
            ChangeNotifierProvider.value(
              value: provider,
            )
          ],
          child: SurveyMetricPage(sg: sg),
        );
      case '/survey':
        return MultiProvider(
          providers: [
            ChangeNotifierProvider.value(
              value: provider,
            )
          ],
          child: SurveyPage(),
        );
      default:
        return Container();
    }
  }
}
