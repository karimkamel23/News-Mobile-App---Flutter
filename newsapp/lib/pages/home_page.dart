import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/consts.dart';
import 'package:newsapp/models/article.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Dio dio = Dio();

  List<Article> articles = [];

  @override
  void initState() {
    super.initState();
    _getNews();
  }

  String formatDateTime(String dateTimeString) {
    if (dateTimeString.isEmpty) {
      return '';
    }
    DateTime dateTime = DateTime.parse(dateTimeString);
    String formattedDateTime =
        DateFormat('yyyy-MM-dd\t\tHH:mm:ss').format(dateTime);
    return formattedDateTime;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "N E W S",
        ),
        centerTitle: true,
      ),
      body: _buildUI(),
    );
  }

  Widget _buildUI() {
    return ListView.builder(
      itemCount: articles.length,
      itemBuilder: (context, index) {
        final article = articles[index];
        return ListTile(
          onTap: () {
            _launchUrl(Uri.parse(article.url ?? ""));
          },
          leading: Image.network(
            article.urlToImage ?? PLACEHOLDER_IMAGE_LINK,
            height: 250,
            width: 100,
            fit: BoxFit.cover,
          ),
          title: Text(article.title ?? ""),
          subtitle: Text(formatDateTime(article.publishedAt ?? "")),
        );
      },
    );
  }

  Future<void> _getNews() async {
    final response = await dio.get(
        'https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=$NEWS_API_KEY');

    final articlesJson = response.data["articles"] as List;
    setState(() {
      List<Article> newsArticle =
          articlesJson.map((a) => Article.fromJson(a)).toList();
      newsArticle = newsArticle.where((a) => a.title != "[Removed]").toList();
      articles = newsArticle;
    });
  }

  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
