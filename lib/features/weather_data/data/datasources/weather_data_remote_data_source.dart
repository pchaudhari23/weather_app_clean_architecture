import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../features/weather_data/data/models/weather_data_model.dart';

String api_key = '0da5ce99a10b05e6a2feb1e4d60dc026';

abstract class WeatherDataRemoteDataSource {

  Future<Either<Failure, WeatherModel>> getWeatherData(String location);
}

class WeatherDataRemoteDataSourceImpl implements WeatherDataRemoteDataSource {

  @override
  Future<Either<Failure, WeatherModel>> getWeatherData(String location) async {

    String api_url = 'http://api.weatherstack.com/current?access_key=$api_key&query=$location';

    Response response = await get(Uri.parse(api_url));

    if (response.statusCode == 200) {
      print(WeatherModel.fromJson(json.decode(response.body)));
      final res = WeatherModel.fromJson(json.decode(response.body));
      return Right(res);
    } else {
      throw ServerException();
    }
  }

}

//------------------------------------------------------------------------------------
// class HttpService {
//   final String postsURL = "https://jsonplaceholder.typicode.com/posts";

//   Future<List<Post>> getPosts() async {
//     Response response = await get(Uri.parse(postsURL));

//     if(response.statusCode == 200) {
//       // List<dynamic> body = Post.fromJson(response.body);
//       List<dynamic> body = jsonDecode(response.body);
      
//       List<Post> posts = body.map((dynamic item) => Post.fromJson(item),).toList();

//       return posts;
//     } else {
//       throw "Unable to retrieve posts.";
//     }

//   }

//   Future<void> deletePost(int id) async {
//     Response res = await delete(Uri.parse("$postsURL/$id"));
//     if (res.statusCode == 200) {
//       print("DELETED");
//     } else {
//       throw "Unable to delete post.";
//     }
//   }
// }