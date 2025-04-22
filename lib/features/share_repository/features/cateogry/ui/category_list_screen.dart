import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/features/share_repository/features/cateogry/bloc/category_list_event.dart';

import '../bloc/category_list_bloc.dart';
import '../bloc/category_list_state.dart';

class CategoryListScreen extends StatefulWidget {
  const CategoryListScreen({super.key});

  @override
  State<CategoryListScreen> createState() => _CategoryListScreenState();
}

class _CategoryListScreenState extends State<CategoryListScreen> {

  @override
  void initState() {
    BlocProvider.of<CategoryListBloc>(context).add(CategoryFetchDataEvent(keyword: ''));
    super.initState();  
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryListBloc, CategoryListState>(
      builder:(context, state) {
        if (state is CategoryListLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is CategoryListSuccessState) {
          return ListView.builder(
            itemCount: state.categoryList.length,            
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(state.categoryList[index], textAlign: TextAlign.center,),
              );
            },
          );
        } else if (state is CategoryListErrorState) {
          return Center(child: Text(state.errorMessage));
        }
        return const SizedBox();
      },
    );
  }
}
