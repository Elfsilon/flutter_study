class Endpoints {
  static const String baseUrl = "https://jsonplaceholder.typicode.com";
  static const String postsEndpoint = "/posts/";
}

class HttpClientConfig {
  static const int receiveTimeout = 15000;
  static const int connectionTimeout = 15000;
}