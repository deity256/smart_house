// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../screens/home_screen.dart';
import '../screens/login_screen.dart';
import '../screens/unknown_route.dart';
import '../screens/users/sub/posts_screen.dart';
import '../screens/users/sub/profile_screen.dart';
import '../screens/users/sub/sub/posts_details.dart';
import '../screens/users/sub/sub/posts_home.dart';
import '../screens/users/users_screen.dart';

class Routes {
  static const String homeScreen = '/';
  static const String _usersScreen = '/users/:id';
  static String usersScreen({@required dynamic id}) => '/users/$id';
  static const String loginScreen = '/login';
  static const String unknownRouteScreen = '*';
  static const all = <String>{
    homeScreen,
    _usersScreen,
    loginScreen,
    unknownRouteScreen,
  };
}

class AppRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.homeScreen, page: HomeScreen),
    RouteDef(
      Routes._usersScreen,
      page: UsersScreen,
      generator: UsersScreenRouter(),
    ),
    RouteDef(Routes.loginScreen, page: LoginScreen),
    RouteDef(Routes.unknownRouteScreen, page: UnknownRouteScreen),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    HomeScreen: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => const HomeScreen(),
        settings: data,
      );
    },
    UsersScreen: (data) {
      final args = data.getArgs<UsersScreenArguments>(
        orElse: () => UsersScreenArguments(),
      );
      return buildAdaptivePageRoute<String>(
        builder: (context) => UsersScreen(
          id: args.id,
          filterFromQuery: data.queryParams['filter'].stringValue ?? 'none',
          container: args.container,
        ),
        settings: data,
      );
    },
    LoginScreen: (data) {
      final args = data.getArgs<LoginScreenArguments>(
        orElse: () => LoginScreenArguments(),
      );
      return buildAdaptivePageRoute<bool>(
        builder: (context) => LoginScreen(
          redirectTo: args.redirectTo,
          destinationArgs: args.destinationArgs,
        ),
        settings: data,
      );
    },
    UnknownRouteScreen: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => UnknownRouteScreen(),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Navigation helper methods extension
/// *************************************************************************

extension AppRouterExtendedNavigatorStateX on ExtendedNavigatorState {
  Future<dynamic> pushHomeScreen() => push<dynamic>(Routes.homeScreen);

  Future<bool> pushLoginScreen({
    String redirectTo,
    Object destinationArgs,
  }) =>
      push<bool>(
        Routes.loginScreen,
        arguments: LoginScreenArguments(
            redirectTo: redirectTo, destinationArgs: destinationArgs),
      );

  Future<dynamic> pushUnknownRouteScreen() =>
      push<dynamic>(Routes.unknownRouteScreen);
}

class UsersScreenRoutes {
  static const String profileScreen = '/';
  static const String postsScreen = '/posts';
  static const all = <String>{
    profileScreen,
    postsScreen,
  };
}

class UsersScreenRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(UsersScreenRoutes.profileScreen, page: ProfileScreen),
    RouteDef(
      UsersScreenRoutes.postsScreen,
      page: PostsScreen,
      generator: PostsScreenRouter(),
    ),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    ProfileScreen: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => ProfileScreen(),
        settings: data,
      );
    },
    PostsScreen: (data) {
      final args = data.getArgs<PostsScreenArguments>(
        orElse: () => PostsScreenArguments(),
      );
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => PostsScreen(userId: args.userId),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Navigation helper methods extension
/// *************************************************************************

extension UsersScreenRouterExtendedNavigatorStateX on ExtendedNavigatorState {
  Future<dynamic> pushProfileScreen() =>
      push<dynamic>(UsersScreenRoutes.profileScreen);

  Future<dynamic> pushPostsScreen({
    int userId,
  }) =>
      push<dynamic>(
        UsersScreenRoutes.postsScreen,
        arguments: PostsScreenArguments(userId: userId),
      );
}

class PostsScreenRoutes {
  static const String postsHome = '/';
  static const String postDetails = '/details';
  static const all = <String>{
    postsHome,
    postDetails,
  };
}

class PostsScreenRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(PostsScreenRoutes.postsHome, page: PostsHome),
    RouteDef(PostsScreenRoutes.postDetails, page: PostDetails),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    PostsHome: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => PostsHome(),
        settings: data,
      );
    },
    PostDetails: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => PostDetails(),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Navigation helper methods extension
/// *************************************************************************

extension PostsScreenRouterExtendedNavigatorStateX on ExtendedNavigatorState {
  Future<dynamic> pushPostsHome() => push<dynamic>(PostsScreenRoutes.postsHome);

  Future<dynamic> pushPostDetails() =>
      push<dynamic>(PostsScreenRoutes.postDetails);
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// UsersScreen arguments holder class
class UsersScreenArguments {
  final int id;
  final Container container;
  UsersScreenArguments({this.id, this.container});
}

/// LoginScreen arguments holder class
class LoginScreenArguments {
  final String redirectTo;
  final Object destinationArgs;
  LoginScreenArguments({this.redirectTo, this.destinationArgs});
}

/// PostsScreen arguments holder class
class PostsScreenArguments {
  final int userId;
  PostsScreenArguments({this.userId});
}
