import 'package:family_code/presentation/screens/about_family_code.dart';
import 'package:family_code/presentation/screens/article_screen.dart';
import 'package:family_code/presentation/screens/chat_screen.dart';
import 'package:family_code/presentation/screens/home_screen.dart';
import 'package:family_code/presentation/screens/info_screen.dart';
import 'package:flutter/material.dart' show BuildContext, Widget;
import 'package:go_router/go_router.dart';

part 'routes.g.dart';

@TypedGoRoute<HomeRoute>(path: '/')
class HomeRoute extends GoRouteData with $HomeRoute {
  @override
  Widget build(BuildContext context, GoRouterState state) => const HomeScreen();
}

@TypedGoRoute<ArticleRoute>(path: '/article/:id')
class ArticleRoute extends GoRouteData with $ArticleRoute {
  final int id;

  ArticleRoute(this.id);

  @override
  Widget build(BuildContext context, GoRouterState state) => ArticleScreen(id: id);
}

@TypedGoRoute<InfoRoute>(path: '/info')
class InfoRoute extends GoRouteData with $InfoRoute {
  @override
  Widget build(BuildContext context, GoRouterState state) => const InfoScreen();
}

@TypedGoRoute<AboutRoute>(path: '/about')
class AboutRoute extends GoRouteData with $AboutRoute {
  @override
  Widget build(BuildContext context, GoRouterState state) => const AboutFamilyCode();
}

@TypedGoRoute<ChatRoute>(path: '/chat')
class ChatRoute extends GoRouteData with $ChatRoute {
  @override
  Widget build(BuildContext context, GoRouterState state) => const ChatScreen();
}
