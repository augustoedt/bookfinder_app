import 'package:book_finder/models/book.dart';
import 'package:book_finder/screens/details_book.dart';
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
              builder: (context)=>DetailBook(book: book,)
            ));
      },
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                width: 128*.8,
                height: 204*0.8,
                decoration: book.volumeInfo.imageLinks==null
                    ?BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black12 ,width: 3)
                )
                    :null,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: book.volumeInfo.imageLinks==null
                      ?Center(child: Text("No Image"))
                      :Image.network(book.volumeInfo.imageLinks.thumbnail, fit: BoxFit.fill,),
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
                      book.volumeInfo.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).primaryTextTheme.headline6
                    ),
                    SizedBox(height: 3,),
                    book.volumeInfo.authors!=null?Text(
                      book.volumeInfo.authors.join(", "),
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
