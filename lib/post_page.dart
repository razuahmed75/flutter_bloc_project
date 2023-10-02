import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_project/bloc/home_bloc.dart';

class PostPage extends StatelessWidget {
  const PostPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<HomeBloc>().add(PostInitialFetchEvent());
    print("================= ${context.read<HomeBloc>().state.counter ?? 0}");
    return Scaffold(
      appBar: AppBar(
        title: Text("Post Page"),
        centerTitle: true,
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is PostLoadingState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is PostFetchingSuccessfullState) {
            // final st = state as PostFetchingSuccessfullState;
            return Column(
              children: [
                Expanded(
                    child: ListView.builder(
                        itemCount: state.postList!.length,
                        itemBuilder: (_, i) {
                          return Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: ListTile(
                              title: Text(state.postList![i].title),
                              subtitle: Text(state.postList![i].body),
                            ),
                          );
                        }))
              ],
            );
          }
          return SizedBox();
        },
      ),
    );
  }
}
