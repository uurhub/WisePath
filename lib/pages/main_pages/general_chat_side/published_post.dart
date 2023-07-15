import 'package:f_8_bootcamp/pages/auth/posts.dart';
import 'package:flutter/material.dart';

class PublishedPostsPage extends StatefulWidget {
  const PublishedPostsPage({super.key});

  @override
  State<PublishedPostsPage> createState() => _PublishedPostsPageState();
}

class _PublishedPostsPageState extends State<PublishedPostsPage> {
  PostService _postService = PostService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Published Posts"),),
    );
  }
}