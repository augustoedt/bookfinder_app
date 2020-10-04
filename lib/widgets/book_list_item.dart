import 'package:book_finder/models/book.dart';
import 'package:flutter/material.dart';

class BookListItem extends StatelessWidget {
  final Book book;

  const BookListItem({Key key, this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Column(
        children: [
          Container(
            width: 128*.8,
            height: 204*.8,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(book.volumeInfo.imageLinks.thumbnail)
                )
            ),
          ),
          Container(
            width: 128*.8,
              child: Text(
                book.volumeInfo.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w700),
              ),)
        ],
      ),
    );
  }
}
