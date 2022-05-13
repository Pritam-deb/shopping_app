class Strings {
  Strings._();
  static final Strings _instance = Strings._();
  factory Strings() => _instance;

  String fetchUrl =
      "https://api.bestbuy.com/v1/products?apiKey=AkSK8XDPG8oIzeGgHZKAA4Ut&format=json&pageSize=10&show=name,image,salePrice,genre,type,plot";
  String fetchComedy =
      "https://api.bestbuy.com/v1/products(genre=Comedy)?apiKey=AkSK8XDPG8oIzeGgHZKAA4Ut&format=json&pageSize=10&show=name,image,salePrice,genre,type,plot";
  String fetchDrama =
      "https://api.bestbuy.com/v1/products(genre=Drama)?apiKey=AkSK8XDPG8oIzeGgHZKAA4Ut&format=json&pageSize=10&show=name,image,salePrice,genre,type,plot";
  String fetchHorror =
      "https://api.bestbuy.com/v1/products(genre=Horror)?apiKey=AkSK8XDPG8oIzeGgHZKAA4Ut&format=json&pageSize=10&show=name,image,salePrice,genre,type,plot";
  String fetchDocumentary =
      "https://api.bestbuy.com/v1/products(genre='Documentary, Special Interests')?apiKey=AkSK8XDPG8oIzeGgHZKAA4Ut&format=json&pageSize=10&show=name,image,salePrice,genre,type,plot";
  String fetchAdventure =
      "https://api.bestbuy.com/v1/products(genre='Action and Adventure')?apiKey=AkSK8XDPG8oIzeGgHZKAA4Ut&format=json&pageSize=10&show=name,image,salePrice,genre,type,plot";

  String hrListOne = "Popular Movies";
  String hrListTwo = "Popular TvShows";
  String seeAll = "See All";
}
