import 'package:book_finder/models/book.dart';
import 'package:book_finder/screens/detail_book/detail_book.dart';
import 'package:book_finder/screens/detail_book/detail_book_animator.dart';
import 'package:flutter/material.dart';

class BookListItem extends StatelessWidget {
  final Book book;

  const BookListItem({Key key, this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context,
            MaterialPageRoute(
              builder: (context)=>DetailBookAnimator(book)
            ));
      },
      child: Column(
        children: [
          Stack(
            children: [
              book.thumbnail==null?
                Container(
                width: 128*.8,
                height: 204*0.8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black12 ,width: 3)
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Center(child: Text("No Image"))
                ),
              ):Hero(
                tag: book.id,
                child: Container(
                  width: 128*.8,
                  height: 204*0.8,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(book.thumbnail.replaceAll("&edge=curl", ""), fit: BoxFit.fill,),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8,),
          Container(
            width: 128*.8,
              child: Column(
                  children: [
                    Text(
                      book.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).primaryTextTheme.headline6
                    ),
                    SizedBox(height: 3,),
                    book.authors!=null?Text(
                      book.authors.join(", "),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).primaryTextTheme.subtitle2,
                    ):Container()
                  ],
              )
          )
        ],
      ),
    );
  }
}
