import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/features/share_repository/features/cateogry/ui/category_list_page.dart';
import 'package:flutter_bloc_demo/features/share_repository/features/dashboard/bloc/category/category_bloc.dart';
import 'package:flutter_bloc_demo/features/share_repository/features/dashboard/bloc/category/category_event.dart';
import 'package:flutter_bloc_demo/features/share_repository/features/dashboard/bloc/category/category_state.dart';
import 'package:flutter_bloc_demo/features/share_repository/repository/category_repository.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    BlocProvider.of<CategoryBloc>(context)
        .add(CategoryFetchDataEvent(keyword: ''));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final categoryRepository = context.read<CategoryRepository>();
    
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 24,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Categories",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(fontWeight: FontWeight.bold)),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CategoryListPage(
                                categoryRepository: categoryRepository),
                          ));
                    },
                    child: Text("VIEW ALL"))
              ],
            ),
          ),
          BlocBuilder<CategoryBloc, CategoryState>(
            builder: (context, state) {
              if (state is CategoryLoadingState) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is CategorySuccessState) {
                return SizedBox(
                  height: 100,
                  width: double.infinity,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.all(8),
                    itemCount: state.categories.length,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        width: 120,
                        height: 100,
                        child: Card(
                          child: Center(
                            child: Text(state.categories[index]),
                          ),
                        ),
                      );
                    },
                  ),
                );
              } else if (state is CategoryErrorState) {
                return Center(child: Text(state.error));
              }
              return const SizedBox();
            },
          )
        ],
      ),
    );
  }
}
