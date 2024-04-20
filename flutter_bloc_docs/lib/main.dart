//import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_docs/counter_page.dart';
//import 'package:flutter_bloc_docs/counter_cubit.dart';
import 'package:flutter_bloc_docs/simple_bloc_observer.dart';
import 'package:flutter_bloc_docs/counter_bloc.dart';

void main() => runApp(CounterApp());

class CounterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (_) => CounterBloc(),
        child: CounterPage(),
      ),
    );
  }
}
// Stream<int> countStream(int max) async* {
//   for (int i = 0; i < max; i++) {
//     yield i;
//   }
// }

// Future<int> sumStream(Stream<int> stream) async {
//   int sum = 0;
//   await for (int value in stream) {
//     sum += value;
//   }
//   return sum;
// }

// Future<void> main() async {
//   //runApp(const MainApp());
//   Bloc.observer = SimpleBlocObserver();
//   CounterBloc()
//     ..add(CounterIncrementPressed())
//     ..close();
  // final bloc = CounterBloc();
  // final suscription = bloc.stream.listen(print);
  // bloc.add(CounterIncrementPressed());
  // await Future.delayed(Duration.zero);
  // await suscription.cancel();
  // await bloc.close();

  // Bloc.observer = SimpleBlocObserver();
  // CounterCubit()
  //   ..increment()
  //   ..close();

  // final cubit = CounterCubit();
  // final subscription = cubit.stream.listen(print);
  // cubit.increment();
  // await Future.delayed(Duration.zero);
  // await subscription.cancel();
  // cubit.close();
  //initialize a stream of integers 0-9
  //Stream<int> stream = countStream(10);
  //Compute the sum of the stream of integers
  //int sum = await sumStream(stream);
  //print the sum
  //print(sum);
//}
