
import 'package:bloc/bloc.dart';
import 'package:githubdemo/Model/UserList.dart';
import 'package:githubdemo/api/api_provider.dart';

abstract class DataState {}

class DataInitial extends DataState {}

class DataLoading extends DataState {}

class DataSuccess extends DataState {
  final Userlist data;
  DataSuccess(this.data);
}
class DataFailed extends DataState {
  final String errorMessage;
  DataFailed(this.errorMessage);
}

class DataEvent {
  final String url;
  DataEvent(this.url);
}

class HomeBloc extends Bloc<DataEvent, DataState> {
  @override
  DataState get initialState => DataInitial();

  @override
  Stream<DataState> mapEventToState(DataEvent event) async* {
    yield DataLoading();
    final apiRepository = ApiProvider();
    final String urls=event.url;
    
     final data = await apiRepository.getGithubUser(urls);
        if (data!=null) {
          yield DataSuccess(data);
        } else {
          yield DataFailed('Failed to fetch data');
        }
  }
}
