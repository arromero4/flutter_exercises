import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_app/main.dart';

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({super.key});

  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  String userNo = '1';
  @override
  Widget build(BuildContext context) {
    return ref
        .watch(
            fetchUserProvider(input: userNo, someValue: 1, secondValue: false))
        .when(
      data: (data) {
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              TextField(
                onSubmitted: (value) => setState(() {
                  userNo = value;
                }),
              ),
              Center(
                child: Text(data.name),
              ),
            ],
          ),
        );
      },
      error: (error, stackTrace) {
        return Center(
          child: Text(
            error.toString(),
          ),
        );
      },
      loading: () {
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
