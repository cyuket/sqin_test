import 'package:flutter/material.dart';

class NavigationService {
  final _key = GlobalKey<NavigatorState>();
  GlobalKey<NavigatorState> get key => _key;
  NavigatorState get state => key.currentState;
  BuildContext get context => state.context;

  /// Pops current screen
  void pop() => state.pop();

  /// Navigates to a route
  void navigateTo(
    String routeName, {
    Object arguments,
  }) {
    state.pushNamed(
      routeName,
      arguments: arguments,
    );
  }

  /// Removes previous route and navigates to a route
  void clearLastAndNavigateTo(
    String routeName, {
    Object arguments,
  }) {
    state.pushReplacementNamed(
      routeName,
      arguments: arguments,
    );
  }

  void removeAllAndNavigateTo(
    String routeName, {
    Object arguments,
  }) {
    state.pushNamedAndRemoveUntil(
      routeName,
      (r) => false,
      arguments: arguments,
    );
  }
}
