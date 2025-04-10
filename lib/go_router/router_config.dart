import 'package:flutter/material.dart';
import 'package:flutter_practical/go_router/router_constants.dart';
import 'package:flutter_practical/go_router/screen/about_screen.dart';
import 'package:flutter_practical/go_router/screen/contact_screen.dart';
import 'package:flutter_practical/go_router/screen/error_page.dart';
import 'package:flutter_practical/go_router/screen/home_screen.dart';
import 'package:flutter_practical/go_router/screen/profile_screen.dart';
import 'package:go_router/go_router.dart';


class MyAppRouter {
  GoRouter router = GoRouter(
    routes: [
      GoRoute(
        name: MyAppRouteConstants.homeRouteName,
        path: "/",
        pageBuilder: (context, state) {
          return MaterialPage(child: HomeScreen());
        },
      ),
      GoRoute(
        name: MyAppRouteConstants.profileRouteName,
        path: "/profile",
        pageBuilder: (context, state) {
          return MaterialPage(child: ProfileScreen());
        },
      ),
      GoRoute(
        name: MyAppRouteConstants.aboutRouteName,
        path: "/about",
        pageBuilder: (context, state) {
          return MaterialPage(child: AboutScreen());
        },
      ),
      GoRoute(
        name: MyAppRouteConstants.contactRouteName,
        path: "/contact",
        pageBuilder: (context, state) {
          return MaterialPage(child: ContactScreen());
        },
      ),
    ],
    errorPageBuilder: (context, state) {
      return MaterialPage(child: ErrorPage());
    },
  );
}
