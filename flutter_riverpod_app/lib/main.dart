import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_app/home_screen.dart';
import 'package:flutter_riverpod_app/logger_riverpod.dart';
import 'package:flutter_riverpod_app/user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'main.g.dart';
//Providers
//Provider
//StateProvider
//StateNotifier and StateNotifierProvider
//ChangeNotifierProvider
//FuturesProvider
//StreamProvider

//Refs
// WidgetRef
// ProviderRef
// Ref

//ProviderObserver
@riverpod
Future<User> fetchUser(FetchUserRef ref,
    {required String input,
    required int someValue,
    required bool secondValue}) {
  final userRepository = ref.watch(UserRepositoryProvider);
  return userRepository.fetchUserData(input);
}

// final fetchUserProvider =
//     FutureProvider.family.autoDispose((ref, String input) {
//   final userRepository = ref.watch(UserRepositoryProvider);
//   return userRepository.fetchUserData(input);
// });

final streamProvider = StreamProvider((ref) async* {
  yield [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
});

void main() {
  runApp(ProviderScope(
    observers: [
      LoggerRiverpod(),
    ],
    child: const MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Riverpod - State Management',
      home: MyHomePage(),
    );
  }
}
