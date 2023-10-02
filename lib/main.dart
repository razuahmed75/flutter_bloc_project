import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_project/bloc/home_bloc.dart';
import 'package:flutter_bloc_project/post_page.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => HomeBloc()),
      ],
      child: GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    HomeBloc provider = context.read<HomeBloc>();
    print("================= ${provider.state.counter ?? 0}");
    // HomeBloc provider = BlocProvider.of<HomeBloc>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  provider.state.counter == null
                      ? "0"
                      : provider.state.counter.toString(),
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            heroTag: 'tag1',
            onPressed: () => provider.add(Increment()),
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            heroTag: 'tag2',
            onPressed: () {
              Get.to(() => PostPage());
            },
            tooltip: 'Post Page',
            child: const Icon(Icons.post_add),
          ),
          FloatingActionButton(
            heroTag: 'tag3',
            onPressed: () => provider.add(Decrement()),
            tooltip: 'Increment',
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
