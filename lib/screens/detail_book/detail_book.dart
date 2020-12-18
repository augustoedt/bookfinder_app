import 'dart:ui';
import 'package:book_finder/models/book.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:book_finder/screens/detail_book/detail_book_animation.dart';

class DetailBook extends StatelessWidget {
  final Book book;
  final DetailBookAnimation animation;

  const DetailBook({
    @required this.book,
    @required this.animation
  });
  Widget _buildImage(BuildContext context, Book book){
    return FadeInImage.assetNetwork(
      placeholder: "img_${book.id}",
      image: book.thumbnail,
      fit: BoxFit.cover,
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(0.1),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
          ),
        ),
        Text(
          "Detail Book",
          overflow: TextOverflow.ellipsis,
          style: Theme
              .of(context)
              .primaryTextTheme
              .headline6
              .copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(width: 50),
      ]),
    );
  }

  Widget _buildImageTitleAuthor(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 8),
        Transform(
          alignment: Alignment.center,
          transform: Matrix4.diagonal3Values(
              animation.pictureSize.value,
              animation.pictureSize.value, 1.0
          ),
          child: SizedBox(
              width: 124 * 0.9,
              height: 204 * 0.9,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: book.thumbnail == null
                    ? const Center(child: Text("No Image"))
                    : _buildImage(context, book),
              )),
        ),
        const SizedBox(height: 8),
        Opacity(
          opacity: animation.titleOpacity.value,
          child: Text(book.title,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: Theme
                  .of(context)
                  .primaryTextTheme
                  .headline2),
        ),
        const SizedBox(height: 5),
        Opacity(
          opacity: animation.authorsOpacity.value,
          child: Text(
            book.authors.join(", "),
            textAlign: TextAlign.center,
            style: Theme
                .of(context)
                .primaryTextTheme
                .headline6,
          ),
        ),
        const SizedBox(height: 10)
      ],
    );
  }

  Widget _buildDescriptionAnimation(BuildContext context) {
    return Transform(
      transform: Matrix4.translationValues(
          0,
          animation.descriptionScrollerYTranslation.value,
          0
      ),
      child: Opacity(
        opacity: animation.descriptionOpacity.value,
        child: _buildDescription(context),
      ),
    );
  }

  Widget _buildDescription(BuildContext context) {
    return Container(
      height: MediaQuery
          .of(context)
          .size
          .height * 0.5,
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 14),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.7),
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25))),
      child: Column(
        children: [
          Expanded(
            child: Scrollbar(
              thickness: 10,
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.only(right: 20),
                  width: double.infinity,
                  child: (book.description == "")
                      ? Text(
                    "Description\n\n${book.filterDescription()}",
                    style: Theme
                        .of(context)
                        .primaryTextTheme
                        .headline4,
                  )
                      : Text("Description\n\n${book.filterDescription()}",
                      style:
                      Theme
                          .of(context)
                          .primaryTextTheme
                          .headline4),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 70,
                child: OutlineButton(
                    highlightedBorderColor: Theme
                        .of(context)
                        .accentColor,
                    splashColor: Theme
                        .of(context)
                        .accentColor,
                    color: Colors.white10,
                    borderSide: const BorderSide(color: Colors.white10, width: 2),
                    onPressed: () {},
                    child: const Icon(Icons.bookmark_border_outlined,color: Colors.black38)
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: RaisedButton(
                    color: Theme
                        .of(context)
                        .accentColor,
                    onPressed: () {},
                    child: Text("Start Reading",
                        style: Theme.of(context).primaryTextTheme.headline6.copyWith(color: Colors.black87,fontWeight: FontWeight.bold))
                )
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildHeader(context),
        _buildImageTitleAuthor(context),
        _buildDescriptionAnimation(context)
      ],
    );
  }

  Widget _buildAnimation(BuildContext context, Widget child) {
    return Stack(
      fit: StackFit.expand,
      children: [
        if (book.thumbnail != null) Hero(
          tag: book.id,
          child: _buildImage(context, book),
        ) else Container(),
        BackdropFilter(
          filter: ImageFilter.blur(
              sigmaX: animation.backdropBlurX.value,
              sigmaY: animation.backdropBlurY.value
          ),
          child: Container(
            color: Theme
                .of(context)
                .primaryColor
                .withOpacity(animation.backdropOpacity.value),
            child: _buildContent(context),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: AnimatedBuilder(
            animation: animation.controller,
            builder: _buildAnimation,
          )
      ),
    );
  }
}
