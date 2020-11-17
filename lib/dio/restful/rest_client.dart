import 'package:dio/dio.dart';
import 'package:myflutterwiget/dio/model/random_user.dart';
import 'package:myflutterwiget/dio/restful/post_body.dart';
import 'package:retrofit/retrofit.dart';
part 'rest_client.g.dart';

@RestApi(baseUrl: 'https://randomuser.me/')
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("api/")
  Future<RandomUser> getRandomUser();

  @GET('fake_api/')
  Future<RandomUser> getFakeRandomUser(@Query('id') String id);

  @POST('fake_post/')
  Future<RandomUser> getFakePost(@Body() MockPostBody body);
}
