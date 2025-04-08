import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/features/repository_provider/bloc/repository_provider_event.dart';
import 'package:flutter_bloc_demo/features/repository_provider/bloc/repository_provider_state.dart';
import 'package:flutter_bloc_demo/features/repository_provider/repository/repository_provider_repository.dart';

class RepositoryProviderBloc extends Bloc<RepositoryProviderEvent, RepositoryProviderState>{
  
  final RepositoryProviderRepository repository;

  RepositoryProviderBloc({required this.repository}) : super(RepositoryProviderState()) {
    on<RepositoryProviderFetchDataEvent>((event, emit) async {
      emit(state.copyWith(isLoading: true));

      String result = await repository.fetchData();
      emit(state.copyWith(isLoading: false, data: result));

    });
  }
}