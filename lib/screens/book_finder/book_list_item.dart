import 'dart:typed_data';
import 'package:book_finder/models/book.dart';
import 'package:book_finder/screens/detail_book/detail_book_animator.dart';
import 'package:book_finder/service/image_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class BookListItem extends StatelessWidget {
  final Book book;
  final Uint8List image;

  const BookListItem({Key key, this.book, this.image}) : super(key: key);

  Widget _imageDisplay(BuildContext context, Book book) {
    if (!kIsWeb) {
      return FutureBuilder<Uint8List>(
        future:
            ImageService.saveImageAndReturnUint8List(book.id, book.thumbnail),
        builder: (_, AsyncSnapshot<Uint8List> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              return Image.memory(snapshot.data, fit: BoxFit.fill);
            }
          }
          if (snapshot.hasError) {
            return const Center(
              child: Icon(Icons.warning, color: Colors.red),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      );
    } else {
      return FadeInImage.assetNetwork(
        fadeInCurve: Curves.bounceIn,
        placeholder: "img_${book.id}",
        image: book.thumbnail,
        fit: BoxFit.cover,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => DetailBookAnimator(book)));
      },
      child: Column(
        children: [
          Stack(
            children: [
              if (book.thumbnail == null)
                Container(
                  width: 128 * .8,
                  height: 204 * 0.8,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black12, width: 3)),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: const Center(child: Text("No Image"))),
                )
              else
                Hero(
                  tag: book.id,
                  child: SizedBox(
                    width: 128 * .8,
                    height: 204 * 0.8,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: _imageDisplay(context, book)
                        // child: Image.network(book.thumbnail.replaceAll("&edge=curl", ""), fit: BoxFit.fill,),
                        ),
                  ),
                ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          SizedBox(
              width: 128 * .8,
              child: Column(
                children: [
                  Text(book.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).primaryTextTheme.headline6),
                  const SizedBox(
                    height: 3,
                  ),
                  if (book.authors != null)
                    Text(
                      book.authors.join(", "),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).primaryTextTheme.subtitle2,
                    )
                  else
                    Container()
                ],
              ))
        ],
      ),
    );
  }
}
