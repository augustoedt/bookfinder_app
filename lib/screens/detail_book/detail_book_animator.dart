import 'package:book_finder/models/book.dart';
import 'package:book_finder/screens/detail_book/detail_book.dart';
import 'package:flutter/material.dart';

import 'detail_book_animation.dart';

class DetailBookAnimator extends StatefulWidget {

  final Book book;
  const DetailBookAnimator(this.book);

  @override
  _DetailBookAnimatorState createState() => _DetailBookAnimatorState();
}

class _DetailBookAnimatorState extends State<DetailBookAnimator>
    with SingleTickerProviderStateMixin{
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 1500),
      vsync: this
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DetailBook(
      book: widget.book,
      animation: DetailBookAnimation(_controller),
    );
  }
}
