class Strings {
  Strings._();
  static final Strings _instance = Strings._();
  factory Strings() => _instance;

  String fetchUrl =
      "https://api.bestbuy.com/v1/products?apiKey=AkSK8XDPG8oIzeGgHZKAA4Ut&format=json&pageSize=10&show=name,image,salePrice,genre,type,plot";
  String hrListOne = "Popular Movies";
  String hrListTwo = "Popular TvShows";
  String seeAll = "See All";
}
