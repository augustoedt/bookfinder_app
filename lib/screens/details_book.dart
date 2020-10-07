import 'dart:ui';

import 'package:book_finder/models/book.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class DetailBook extends StatelessWidget {
  final Book book;

  const DetailBook({Key key, this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              child: book.volumeInfo.imageLinks==null
                  ?Center(child: Text("No Image"))
                  :Image.network(book.volumeInfo.imageLinks.thumbnail, fit: BoxFit.fill,),
            ),
            Container(
              width: double.infinity,
              height: double.infinity,
              child: ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 30,
                    sigmaY: 4,
                  ),
                  child: Container(
                    color: Theme.of(context).primaryColor.withOpacity(0.5),
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              color: Colors.black.withOpacity(0.05),
              height: 50,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: IconButton(
                          icon: Icon(
                            Icons.arrow_back_rounded,
                            color: Colors.white,
                          ),
                        )),
                    Expanded(
                      child: Container(
                        child: Center(
                          child: Text("Detail Book",
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).primaryTextTheme.headline6,),
                        ),
                      ),
                    ) ,
                    SizedBox(width: 50,),
                  ]
              ),
            ),
            Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 75,),
                Center(
                  child: Container(
                      width: 124*0.9,
                      height: 204*0.9,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: book.volumeInfo.imageLinks==null
                            ?Center(child: Text("No Image"))
                            :Image.network(book.volumeInfo.imageLinks.thumbnail, fit: BoxFit.fill,),
                      ))
                ),
                SizedBox(height: 8,),
                Container(
                  padding: EdgeInsets.all(5),
                  child: Text(book.volumeInfo.title,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      style: Theme.of(context).primaryTextTheme.headline2)),
                Container(
                  child: Text(book.volumeInfo.authors.join(", "), style:  Theme.of(context).primaryTextTheme.headline6,),
                ),
                SizedBox(height: 25,),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 18, horizontal: 14),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.7),
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25))
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: Scrollbar(
                            thickness: 3,
                            child: SingleChildScrollView(
                              child: Container(
                                padding: EdgeInsets.only(right: 5),
                                width: double.infinity,
                                child: (book.volumeInfo.description=="")
                                    ?Text("Description\n\n${book.filter()}", style: Theme.of(context).primaryTextTheme.headline4,)
                                    :Text("Description\n\n${book.filter()}", style: Theme.of(context).primaryTextTheme.headline4),),
                            ),
                          ),
                        ),
                        SizedBox(height: 8,),
                        Row(
                          children: [
                            SizedBox(
                              width: 70,
                              child: OutlineButton(
                                  highlightedBorderColor: Theme.of(context).accentColor,
                                  splashColor: Theme.of(context).accentColor,
                                  color: Colors.white10,
                                  borderSide: BorderSide(
                                    color: Colors.white10,
                                    width: 2
                                  ),
                                  child: Icon(Icons.bookmark_border_outlined, color: Colors.black38,),
                                  onPressed: (){}
                              ),
                            ),
                            SizedBox(width: 12,),
                            Expanded(
                              child: RaisedButton(
                                  color: Theme.of(context).accentColor,
                                  // color: Theme.of(context).accentColor,
                                  child: Text("Start Reading", style: Theme.of(context).primaryTextTheme.headline6),
                                  onPressed: (){}
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
