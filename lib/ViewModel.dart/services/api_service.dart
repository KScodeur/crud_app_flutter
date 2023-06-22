import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import '../../Models/post_model.dart';
part 'api_service.g.dart';

@RestApi(baseUrl: 'https://jsonplaceholder.typicode.com/')
abstract class ApiService {
  factory ApiService(Dio dio) = _ApiService;

  @GET('posts')
  Future<List<PostModel>> getPosts();
}
 