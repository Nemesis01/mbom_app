import 'package:flutter/material.dart';
import 'package:mbom_app/blocs/bloc_login.dart';
import 'package:mbom_app/blocs/bloc_account.dart';
import 'package:mbom_app/blocs/bloc_categories.dart';
import 'package:mbom_app/blocs/bloc_home_screen.dart';
import 'package:mbom_app/blocs/bloc_profile.dart';
import 'package:mbom_app/blocs/bloc_provider.dart';

import 'package:mbom_app/views/screen_login.dart';
import 'package:mbom_app/views/screen_account.dart';
import 'package:mbom_app/views/screen_categories.dart';
import 'package:mbom_app/views/screen_home.dart';
import 'package:mbom_app/views/screen_orders.dart';
import 'package:mbom_app/views/screen_profile.dart';

import 'package:mbom_app/blocs/bloc_orders.dart';
import 'package:mbom_app/blocs/bloc_preferences.dart';
import 'res/Strings.dart';
import 'views/screen_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.deepPurple,
          primaryColor: Colors.white,
          accentColor: Colors.deepPurple,
          canvasColor: Colors.white,
          fontFamily: 'Quicksand',
          //typography: Typography.englishLike2018,
          textTheme: TextTheme(
            headline1: TextStyle(
              fontSize: 96,
              fontWeight: FontWeight.w300,
              letterSpacing: -1.5,
            ),
            headline2: TextStyle(
              fontSize: 60,
              fontWeight: FontWeight.w300,
              letterSpacing: -0.5,
            ),
            headline3: TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.0,
            ),
            headline4: TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.25,
            ),
            headline5: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.0,
            ),
            headline6: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.15,
            ),
            subtitle1: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.15,
            ),
             subtitle2: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.10,
            ),
            bodyText1: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.5,
            ),
            bodyText2: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.25,
            ),
             button: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              letterSpacing: 1.25,              
            ),
            caption: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.4,
            ),
            overline: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w400,
              letterSpacing: 1.5,
            ),
          ),
          buttonTheme: ButtonThemeData(
            textTheme: ButtonTextTheme.normal
          ),
          buttonBarTheme: ButtonBarThemeData(),
          iconTheme: IconThemeData(color: Colors.deepPurple),
          cursorColor: Colors.black),
      //home: HomeScreen(),
      onGenerateRoute: _getRoute,
    );
  }
}

Route _getRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return _buildRoute(
        settings,
        new BlocProvider<LoginBloc>(
          bloc: new LoginBloc(),
          child: new LoginScreen(),
        ),
      );
    case '/${Strings.title_home}':
      return _buildRoute(settings, new HomeScreen());
    case '/${Strings.title_profile}':
      return _buildRoute(
        settings,
        new BlocProvider<ProfileBloc>(
          bloc: new ProfileBloc(),
          child: new ProfileScreen(),
        ),
      );
    case '/categories':
      return _buildRoute(
        settings,
        new BlocProvider<CategoriesBloc>(
          bloc: CategoriesBloc(),
          child: CategoriesScreen(),
        ),
      );
    case '/account':
      return _buildRoute(
        settings,
        new BlocProvider<AccountBloc>(
          bloc: AccountBloc(),
          child: AccountScreen(),
        ),
      );
    case '/settings':
      return _buildRoute(
        settings,
        new BlocProvider<AccountBloc>(
          bloc: AccountBloc(),
          child: AccountScreen(),
        ),
      );
    case '/orders':
      return _buildRoute(
        settings,
        new BlocProvider<OrdersBloc>(
          bloc: OrdersBloc(),
          child: OrdersScreen(),
        ),
      );
    case '/wallet':
      return _buildRoute(
        settings,
        new BlocProvider<AccountBloc>(
          bloc: AccountBloc(),
          child: AccountScreen(),
        ),
      );
    case '/addresses':
      return _buildRoute(
        settings,
        new BlocProvider<AccountBloc>(
          bloc: AccountBloc(),
          child: AccountScreen(),
        ),
      );
    case '/preferences':
      return _buildRoute(
        settings,
        new BlocProvider<PreferencesBloc>(
          bloc: PreferencesBloc(),
          child: PreferencesScreen(),
        ),
      );
    default:
      return _buildRoute(settings, new HomeScreen());
  }
}

MaterialPageRoute _buildRoute(RouteSettings settings, Widget builder) {
  return MaterialPageRoute(
    settings: settings,
    builder: (BuildContext context) => builder,
  );
}
