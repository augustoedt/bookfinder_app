class BookSearch{
  String term;
  int maxResults;
  int startIndex = 0;

  BookSearch({this.maxResults, this.startIndex,this.term});

  String url(){
    return "https://www.googleapis.com/books/v1/volumes?q=${this.term}";
  }

  String urlnext(){
    startIndex +=10;
    return "https://www.googleapis.com/books/v1/volumes?q=${this.term}&startIndex=${this.startIndex}";
  }
}