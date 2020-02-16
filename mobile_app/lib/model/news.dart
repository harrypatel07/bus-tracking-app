import 'package:flutter/material.dart';

class News {
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String publishedAt;
  String content;

  News(
      {this.author,
      this.title,
      this.description,
      this.url,
      this.urlToImage,
      this.publishedAt,
      this.content});

  factory News.fromJson(Map<String, dynamic> data) {
    return News(
      author: data['author'] as String,
      title: data['title'] as String,
      description: data['description'] as String,
      url: data['url'] as String,
      urlToImage: data['urlToImage'] as String,
      publishedAt: data['publishedAt'] as String,
      content: data['content'] as String,
    );
  }
}
