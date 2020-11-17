# restful自动生成api
##  https://pub.dev/packages/retrofit
* 1. 添加一下代码（_RestClient报错先忽略）
```
@RestApi(baseUrl: 'https://randomuser.me/')
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/tasks")
  Future<RandomUser> getRandomUser();
}
```
* 2.执行 
```
flutter pub run build_runner build
```
* 3.提示缺少part
```
Missing "part 'rest_client.g.dart';
```
* 4.添加part后，再次执行步骤2即可生成rest_client.g.part

```
part 'rest_client.g.dart';
```
