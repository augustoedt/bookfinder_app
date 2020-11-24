import 'package:book_finder/models/book.dart';
import 'package:book_finder/screens/widgets/book_list_item.dart';
import 'package:flutter/material.dart';

class BookItemGrid extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container();
      // return GridView.builder(
      //   gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
      //     mainAxisSpacing: 5,
      //     crossAxisSpacing: 5,
      //     maxCrossAxisExtent: 150,
      //     childAspectRatio: 120/240
      //   ),
      //   itemCount: bookList.length,
      //   itemBuilder: (_,index){
      //     return BookListItem(book: bookList[index],);
      //   },
      // );
  }
}
