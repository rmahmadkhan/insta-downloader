import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:insta_downloader/ui/screens/home/home_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: HomeScreen.routeName,
  routerNeglect: true,
  routes: [
    GoRoute(
      path: HomeScreen.routeName,
      builder: (context, state) => const HomeScreen(),
    ),
  ],
  errorPageBuilder: (context, state) => MaterialPage(
    key: state.pageKey,
    child: Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(state.error.toString()),
          ],
        ),
      ),
    ),
  ),
);
