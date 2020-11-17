import 'package:dio/dio.dart';
import 'package:myflutterwiget/dio/model/random_user.dart';
import 'package:retrofit/retrofit.dart';
part 'rest_client.g.dart';

@RestApi(baseUrl: 'https://randomuser.me/')
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("api/")
  Future<RandomUser> getRandomUser();
}
