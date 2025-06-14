class Articlmodel {
  final String title, description, urlToImage, content, url, puplishedat;
  Articlmodel({
    required this.content,
    required this.description,
    required this.title,
    required this.url,
    required this.urlToImage,
    required this.puplishedat,
  });
  factory Articlmodel.fromjson(dynamic json) {
    return Articlmodel(
      puplishedat: json["publishedAt"] is String ? json["publishedAt"] : "",
      content: json["content"] is String ? json["content"] : "",
      description: json["description"] is String ? json["description"] : "",
      title: json["title"] is String ? json["title"] : "",
      url: json["url"] is String ? json["url"] : "",
      urlToImage: json["urlToImage"] is String ? json["urlToImage"] : "",
    );
  }
}
