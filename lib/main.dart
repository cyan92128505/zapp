import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:zapp/views/todo_list.dart';

void main() {
  runApp(
    const ProviderScope(
      child: TodoApp(),
    ),
  );
}

final _parentKey = GlobalKey<NavigatorState>();
final routerConfig =
    GoRouter(navigatorKey: _parentKey, initialLocation: '/', routes: [
  GoRoute(
    parentNavigatorKey: _parentKey,
    path: '/',
    name: '/',
    pageBuilder: (context, state) => const MaterialPage(child: TodoList()),
  ),
]);

class TodoApp extends HookWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      routerConfig: routerConfig,
    );
  }
}
