import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:user_app_flutter/Models/post_model.dart';
import 'package:user_app_flutter/ViewModel.dart/services/api_service.dart';

class RetrofitPage extends StatelessWidget {
  const RetrofitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('data')
      ),
      body: _body()
    );
  }
  FutureBuilder _body(){
    final apiService = ApiService(Dio(BaseOptions(contentType: "application/json")));
    return FutureBuilder(builder: ((context, snapshot) {
       if (snapshot.connectionState == ConnectionState.done) {
            final List<PostModel> posts = snapshot.data!;
            return _posts(posts);
          } else{
            return const  Center(
              child: CircularProgressIndicator(),
            );
          }
    }));
  } 

Widget _posts(List<PostModel> posts){
  return ListView.builder(
    itemCount: posts.length,
    itemBuilder: ((context, index) {
    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Text(posts[index].title),
          SizedBox(),
          Text(posts[index].body),
          
        ],
      ),
    );
  }));
}
}