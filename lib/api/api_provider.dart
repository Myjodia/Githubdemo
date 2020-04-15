
import 'package:dio/dio.dart';
import 'package:githubdemo/Model/UserList.dart';


class ApiProvider {
  final Dio _dio = Dio();

  void printOutError(error, StackTrace stacktrace) {
    print('Exception occured: $error with stacktrace: $stacktrace');
  }

  Future<Userlist> getGithubUser(String url) async {
    try {
      final response = await _dio.get(url); 
      print(response.data);
      return Userlist.fromJson(response.data);
    } catch (error, stacktrace) {
      printOutError(error, stacktrace);

    }
  }
}
