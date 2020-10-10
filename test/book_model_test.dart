import 'package:book_finder/models/book.dart';
import 'package:test/test.dart';

void main(){
  var items = values['items'];
  List<Book> modelList;
  test("fromJson",() async {
    modelList = (items as List).map((e) => Book.fromJson(e)).toList();
    expect(modelList.map((e){return (e.thumbnail is String);}).toList(),[true, true, false, true, true, true, true, false, true, true]);
    expect(modelList.map((e){return (e.authors.length);}).toList(),[0, 1, 1, 1, 2, 1, 1, 1, 1, 1]);
  });
  test("toJson",(){
    var map = (items as List);
    for(int i=0;i<map.length;i++) {
      expect(modelList[i].toJson()['authors'] ?? [],
          items[i]['volumeInfo']['authors'] ?? []);
      expect(modelList[i].toJson()['title'],
          items[i]['volumeInfo']['title']);
      expect(modelList[i].toJson()['publisher'],
          items[i]['volumeInfo']['publisher']);
      expect(modelList[i].toJson()['description'],
          items[i]['volumeInfo']['description']);
      expect(modelList[i].toJson()['thumbnail'],
          (items[i]['volumeInfo']['imageLinks']??{})['thumbnail'] ?? null);
      expect(modelList[i].toJson()['smallThumbnail'] ?? null,
          (items[i]['volumeInfo']['imageLinks']??{})['smallThumbnail']);
      expect(modelList[i].toJson()['textSnippet'],
          (items[i]['searchInfo']??{})['textSnippet'] ?? null);
    }
  });
}


Map<String, dynamic> values = {
  "kind": "books#volumes",
  "totalItems": 484,
  "items": [
    {
      "kind": "books#volume",
      "id": "Pi7KDwAAQBAJ",
      "etag": "0LMTiOVj5a4",
      "selfLink": "https://www.googleapis.com/books/v1/volumes/Pi7KDwAAQBAJ",
      "volumeInfo": {
        "title": "Flutter na prática",
        "subtitle": "Melhore seu desenvolvimento mobile com o SDK open source mais recente do Google",
        "publisher": "Novatec Editora",
        "publishedDate": "2020-01-20",
        "description": "Saiba o que o Flutter tem para oferecer, de onde ele veio e para onde vai. O desenvolvimento de aplicativos móveis está progredindo rapidamente, e com o Flutter – um SDK open source de desenvolvimento de aplicações móveis criado pelo Google – você pode desenvolver aplicações para Android e iOS, assim como para o Google Fuchsia. Você aprenderá a criar três aplicativos (um gerenciador de informações pessoais, um sistema de chat e um projeto de game) que poderá instalar em seus dispositivos móveis e de fato usar. Começará ganhando uma base sólida sobre o Flutter e a usará imediatamente para construir dois aplicativos de produtividade mais tradicionais. Também aprenderá a criar um game, o que lhe permitirá ter uma perspectiva totalmente diferente do que o Flutter pode fazer. Além de construir esses aplicativos, você se beneficiará da verificação de problemas do mundo real com os quais pode deparar, e de maneiras de lidar com eles com dicas e truques, tudo isso pensado para tornar sua experiência com o Flutter muito mais produtiva e, na verdade, divertida! Flutter na Prática lhe dará uma base sólida de como construir aplicativos com o Flutter, e será um trampolim para a criação de aplicativos mais avançados por sua própria conta. Após a leitura deste material, uma jornada maior começará à medida que você entrar, mais bem preparado, no imenso universo do desenvolvimento com o Flutter, abordando com firmeza qualquer projeto com o qual deparar. Flutter na Prática é uma aventura de aprendizado que não deve ser perdida.",
        "industryIdentifiers": [
          {
            "type": "ISBN_13",
            "identifier": "9788575228234"
          },
          {
            "type": "ISBN_10",
            "identifier": "8575228234"
          }
        ],
        "readingModes": {
          "text": true,
          "image": false
        },
        "pageCount": 368,
        "printType": "BOOK",
        "categories": [
          "Computers"
        ],
        "maturityRating": "NOT_MATURE",
        "allowAnonLogging": true,
        "contentVersion": "1.2.2.0.preview.2",
        "panelizationSummary": {
          "containsEpubBubbles": false,
          "containsImageBubbles": false
        },
        "imageLinks": {
          "smallThumbnail": "http://books.google.com/books/content?id=Pi7KDwAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api",
          "thumbnail": "http://books.google.com/books/content?id=Pi7KDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api"
        },
        "language": "pt",
        "previewLink": "http://books.google.com.br/books?id=Pi7KDwAAQBAJ&pg=PT19&dq=flutter&hl=&cd=1&source=gbs_api",
        "infoLink": "https://play.google.com/store/books/details?id=Pi7KDwAAQBAJ&source=gbs_api",
        "canonicalVolumeLink": "https://play.google.com/store/books/details?id=Pi7KDwAAQBAJ"
      },
      "saleInfo": {
        "country": "BR",
        "saleability": "FOR_SALE",
        "isEbook": true,
        "listPrice": {
          "amount": 92,
          "currencyCode": "BRL"
        },
        "retailPrice": {
          "amount": 92,
          "currencyCode": "BRL"
        },
        "buyLink": "https://play.google.com/store/books/details?id=Pi7KDwAAQBAJ&rdid=book-Pi7KDwAAQBAJ&rdot=1&source=gbs_api",
        "offers": [
          {
            "finskyOfferType": 1,
            "listPrice": {
              "amountInMicros": 92000000,
              "currencyCode": "BRL"
            },
            "retailPrice": {
              "amountInMicros": 92000000,
              "currencyCode": "BRL"
            },
            "giftable": true
          }
        ]
      },
      "accessInfo": {
        "country": "BR",
        "viewability": "PARTIAL",
        "embeddable": true,
        "publicDomain": false,
        "textToSpeechPermission": "ALLOWED",
        "epub": {
          "isAvailable": true,
          "acsTokenLink": "http://books.google.com.br/books/download/Flutter_na_pr%C3%A1tica-sample-epub.acsm?id=Pi7KDwAAQBAJ&format=epub&output=acs4_fulfillment_token&dl_type=sample&source=gbs_api"
        },
        "pdf": {
          "isAvailable": false
        },
        "webReaderLink": "http://play.google.com/books/reader?id=Pi7KDwAAQBAJ&hl=&printsec=frontcover&source=gbs_api",
        "accessViewStatus": "SAMPLE",
        "quoteSharingAllowed": false
      },
      "searchInfo": {
        "textSnippet": "Uma das decisões importantes que o Google tomou ao projetar o \u003cb\u003eFlutter\u003c/b\u003e é algo \u003cbr\u003e\nque o diferencia da maioria das outras opções de desenvolvimento móvel, ou \u003cbr\u003e\nseja, o fato de o \u003cb\u003eFlutter\u003c/b\u003e renderizar os próprios componentes de UI. Ao contrário \u003cbr\u003e\nde&nbsp;..."
      }
    },
    {
      "kind": "books#volume",
      "id": "EcPxDwAAQBAJ",
      "etag": "NYYGcCFrC8s",
      "selfLink": "https://www.googleapis.com/books/v1/volumes/EcPxDwAAQBAJ",
      "volumeInfo": {
        "title": "Iniciando com Flutter Framework",
        "subtitle": "Desenvolva aplicações móveis no Dart Side!",
        "authors": [
          "Leonardo H. Marinho"
        ],
        "publisher": "Casa do Código",
        "publishedDate": "2020-07-17",
        "description": "No desenvolvimento de aplicativos para dispositivos móveis, precisamos nos preocupar muito mais com a usabilidade, interface gráfica, desempenho e praticidade. A escolha das ferramentas corretas impacta diretamente na qualidade do que estamos construindo quando produto final. Um mundo ideal seria poder obter o mesmo processamento e renderização de uma aplicação nativa em uma aplicação híbrida que possibilitasse escrever apenas um código e executar para todas as plataformas. Flutter veio com uma proposta totalmente diferente de seus antecessores e promete ser um framework que realmente divida águas no meio tecnológico. Neste livro, Leonardo Marinho mostra quais dores o Flutter veio para curar, com a criação de aplicativos verdadeiramente performáticos, atrativos e multiplataforma. Você conhecerá desde a arquitetura de software fantástica por baixo dele e as razões pelas quais Dart foi a linguagem escolhida para programar nele, verá que tudo será organizado com Widgets e poderá aproveitá-los ao máximo. Pelo caminho, colocará em prática as principais etapas da criação de um aplicativo, como gerenciamento de dependências, requisições http, banco de dados local, testes automatizados, estilização e muito mais!",
        "industryIdentifiers": [
          {
            "type": "ISBN_13",
            "identifier": "9786586110289"
          },
          {
            "type": "ISBN_10",
            "identifier": "6586110289"
          }
        ],
        "readingModes": {
          "text": true,
          "image": true
        },
        "pageCount": 187,
        "printType": "BOOK",
        "categories": [
          "Computers"
        ],
        "maturityRating": "NOT_MATURE",
        "allowAnonLogging": false,
        "contentVersion": "1.4.4.0.preview.3",
        "panelizationSummary": {
          "containsEpubBubbles": false,
          "containsImageBubbles": false
        },
        "imageLinks": {
          "smallThumbnail": "http://books.google.com/books/content?id=EcPxDwAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api",
          "thumbnail": "http://books.google.com/books/content?id=EcPxDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api"
        },
        "language": "pt",
        "previewLink": "http://books.google.com.br/books?id=EcPxDwAAQBAJ&pg=PT3&dq=flutter&hl=&cd=2&source=gbs_api",
        "infoLink": "https://play.google.com/store/books/details?id=EcPxDwAAQBAJ&source=gbs_api",
        "canonicalVolumeLink": "https://play.google.com/store/books/details?id=EcPxDwAAQBAJ"
      },
      "saleInfo": {
        "country": "BR",
        "saleability": "FOR_SALE",
        "isEbook": true,
        "listPrice": {
          "amount": 39.9,
          "currencyCode": "BRL"
        },
        "retailPrice": {
          "amount": 39.9,
          "currencyCode": "BRL"
        },
        "buyLink": "https://play.google.com/store/books/details?id=EcPxDwAAQBAJ&rdid=book-EcPxDwAAQBAJ&rdot=1&source=gbs_api",
        "offers": [
          {
            "finskyOfferType": 1,
            "listPrice": {
              "amountInMicros": 39900000,
              "currencyCode": "BRL"
            },
            "retailPrice": {
              "amountInMicros": 39900000,
              "currencyCode": "BRL"
            },
            "giftable": true
          }
        ]
      },
      "accessInfo": {
        "country": "BR",
        "viewability": "PARTIAL",
        "embeddable": true,
        "publicDomain": false,
        "textToSpeechPermission": "ALLOWED",
        "epub": {
          "isAvailable": true,
          "acsTokenLink": "http://books.google.com.br/books/download/Iniciando_com_Flutter_Framework-sample-epub.acsm?id=EcPxDwAAQBAJ&format=epub&output=acs4_fulfillment_token&dl_type=sample&source=gbs_api"
        },
        "pdf": {
          "isAvailable": true,
          "acsTokenLink": "http://books.google.com.br/books/download/Iniciando_com_Flutter_Framework-sample-pdf.acsm?id=EcPxDwAAQBAJ&format=pdf&output=acs4_fulfillment_token&dl_type=sample&source=gbs_api"
        },
        "webReaderLink": "http://play.google.com/books/reader?id=EcPxDwAAQBAJ&hl=&printsec=frontcover&source=gbs_api",
        "accessViewStatus": "SAMPLE",
        "quoteSharingAllowed": false
      },
      "searchInfo": {
        "textSnippet": "do \u003cb\u003eFlutter\u003c/b\u003e e conseguir somar toda a minha experiência acadêmica e profissional \u003cbr\u003e\npara tornar isso possível e muito mais rápido. Conhecer a linguagem Dart e \u003cbr\u003e\n\u003cb\u003eFlutter\u003c/b\u003e deixou de ser um extra e passou a ser uma exigência do mercado móvel."
      }
    },
    {
      "kind": "books#volume",
      "id": "Jhd5xAEACAAJ",
      "etag": "resTkfvpm2k",
      "selfLink": "https://www.googleapis.com/books/v1/volumes/Jhd5xAEACAAJ",
      "volumeInfo": {
        "title": "Learn Google Flutter Fast",
        "subtitle": "65 Example Apps",
        "authors": [
          "Mark Clow"
        ],
        "publishedDate": "2019-04",
        "description": "Learn Google Flutter by example. Over 65 example mini-apps. Chapters Include: Three Chapters on Dart Language. Introduction to Flutter. Installing Flutter. Your first Flutter App. Dependencies & Packages. Introduction to Widgets & Composition. Stateless Widgets. Stateful Widgets. Basic Material Widgets. Multi-Child Widgets. Single-Child Widgets. App Scaffolding Widgets. Other Widgets. Builders. Routing & Navigation. Forms. Http, Apis, REST & JSON. Flutter with Http, Apis, REST & JSON. State. State & Stateful Widgets. State & InheritedWidgets. State & Scoped Model. State & BLoCs with Streams. Local Persistence. Mixins. Debugging & Performance Profiling. Change Detection, Keys & Rendering. Other Performance Considerations. Publishing Your App. Flutter Resources.",
        "industryIdentifiers": [
          {
            "type": "ISBN_10",
            "identifier": "1092297375"
          },
          {
            "type": "ISBN_13",
            "identifier": "9781092297370"
          }
        ],
        "readingModes": {
          "text": false,
          "image": false
        },
        "pageCount": 474,
        "printType": "BOOK",
        "maturityRating": "NOT_MATURE",
        "allowAnonLogging": false,
        "contentVersion": "preview-1.0.0",
        "panelizationSummary": {
          "containsEpubBubbles": false,
          "containsImageBubbles": false
        },
        "language": "en",
        "previewLink": "http://books.google.com.br/books?id=Jhd5xAEACAAJ&dq=flutter&hl=&cd=3&source=gbs_api",
        "infoLink": "http://books.google.com.br/books?id=Jhd5xAEACAAJ&dq=flutter&hl=&source=gbs_api",
        "canonicalVolumeLink": "https://books.google.com/books/about/Learn_Google_Flutter_Fast.html?hl=&id=Jhd5xAEACAAJ"
      },
      "saleInfo": {
        "country": "BR",
        "saleability": "NOT_FOR_SALE",
        "isEbook": false
      },
      "accessInfo": {
        "country": "BR",
        "viewability": "NO_PAGES",
        "embeddable": false,
        "publicDomain": false,
        "textToSpeechPermission": "ALLOWED",
        "epub": {
          "isAvailable": false
        },
        "pdf": {
          "isAvailable": false
        },
        "webReaderLink": "http://play.google.com/books/reader?id=Jhd5xAEACAAJ&hl=&printsec=frontcover&source=gbs_api",
        "accessViewStatus": "NONE",
        "quoteSharingAllowed": false
      },
      "searchInfo": {
        "textSnippet": "Learn Google Flutter by example."
      }
    },
    {
      "kind": "books#volume",
      "id": "r4RuXqUewSQC",
      "etag": "5+2n3yrLLqo",
      "selfLink": "https://www.googleapis.com/books/v1/volumes/r4RuXqUewSQC",
      "volumeInfo": {
        "title": "Flutter",
        "subtitle": "A Very Special Pigeon",
        "authors": [
          "Marjorie Barclay"
        ],
        "publisher": "AuthorHouse",
        "publishedDate": "2010-08",
        "description": "Flutter, the pigeon, begins his story shortly after birth and describes his life growing up in the loft, as well as the training process he goes through on his way to becoming a racer. His thoughts are often humorous and the descriptive photographs will delight your children.",
        "industryIdentifiers": [
          {
            "type": "ISBN_13",
            "identifier": "9781452063621"
          },
          {
            "type": "ISBN_10",
            "identifier": "1452063621"
          }
        ],
        "readingModes": {
          "text": true,
          "image": true
        },
        "pageCount": 40,
        "printType": "BOOK",
        "categories": [
          "Juvenile Nonfiction"
        ],
        "maturityRating": "NOT_MATURE",
        "allowAnonLogging": false,
        "contentVersion": "preview-1.0.0",
        "imageLinks": {
          "smallThumbnail": "http://books.google.com/books/content?id=r4RuXqUewSQC&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api",
          "thumbnail": "http://books.google.com/books/content?id=r4RuXqUewSQC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api"
        },
        "language": "en",
        "previewLink": "http://books.google.com.br/books?id=r4RuXqUewSQC&printsec=frontcover&dq=flutter&hl=&cd=4&source=gbs_api",
        "infoLink": "http://books.google.com.br/books?id=r4RuXqUewSQC&dq=flutter&hl=&source=gbs_api",
        "canonicalVolumeLink": "https://books.google.com/books/about/Flutter.html?hl=&id=r4RuXqUewSQC"
      },
      "saleInfo": {
        "country": "BR",
        "saleability": "NOT_FOR_SALE",
        "isEbook": false
      },
      "accessInfo": {
        "country": "BR",
        "viewability": "PARTIAL",
        "embeddable": true,
        "publicDomain": false,
        "textToSpeechPermission": "ALLOWED",
        "epub": {
          "isAvailable": true,
          "acsTokenLink": "http://books.google.com.br/books/download/Flutter-sample-epub.acsm?id=r4RuXqUewSQC&format=epub&output=acs4_fulfillment_token&dl_type=sample&source=gbs_api"
        },
        "pdf": {
          "isAvailable": false
        },
        "webReaderLink": "http://play.google.com/books/reader?id=r4RuXqUewSQC&hl=&printsec=frontcover&source=gbs_api",
        "accessViewStatus": "SAMPLE",
        "quoteSharingAllowed": false
      },
      "searchInfo": {
        "textSnippet": "Flutter, the pigeon, begins his story shortly after birth and describes his life growing up in the loft, as well as the training process he goes through on his way to becoming a racer."
      }
    },
    {
      "kind": "books#volume",
      "id": "mgAnvUmqhfUC",
      "etag": "9BIeLLU0jKk",
      "selfLink": "https://www.googleapis.com/books/v1/volumes/mgAnvUmqhfUC",
      "volumeInfo": {
        "title": "Flutter by",
        "authors": [
          "Rev. Eleanor Ditrick",
          "Chap"
        ],
        "publisher": "Dog Ear Publishing",
        "publishedDate": "2008-12",
        "description": "\"Flutter by\" began just as its name implies ... with the sharing of little flutters of thought among co-workers and friends. The messages fluttered into their lives quietly and with serenity ... much like the Monarch butterfly -- a personal favorite of mine. My daily messages include a prayer and oftentimes a short story or quotation to show how that reflection applies to our lives and to our humanness. They revolve around the people, places, and particulars in my world -- which are pretty much the same as those in yours. My prayer is that this book helps you through each day with a flutter of thought, a breath of calmness, and a reflection for peace, love, and endurance. I pray that these little thoughts help you smile and see the true beauty of God's touch in each day -- even in those filled with sorrow. For, as we flutter by, we flutter on. Through Flutter by, you'll meet my husband Howard (often referred to as Ole Buckeye ... Ohio State is his alma mater.); our daughters Diane and Lori; and, of course, Chaplain Ditrick the Third (our Shetland sheepdog). Most times, \"Chap\" concludes my prayerful thoughts with a flutter of his own. They usually involve \"treats.\" As a hospital chaplain, I got to know and become close to many of the staff, especially the nurses. One friend in particular was going through a very difficult time in her personal life. She faced continuous challenges and difficult decisions. Often, she confided that she didn't know how or even if she would get through it all. Each time that we talked, I came away feeling that I wanted to be so much more than someone who listened. I wanted to do something to ease her pain. I asked God to guide me to an answer to calm her burden. On one particularly busy day, I knew that our paths would not cross, but I wanted my friend to know that I was thinking about and praying for her. I wrote her a quick little prayer and sent it off through the inner-office mail. (This was before computers!) A few days, later, I sent another prayer ... then another ... and another. When we met up several days later, she thanked me again and again. She told me how much those little prayers meant to her and how she looked forward to receiving them. She asked if she could share them with friends at the hospital. I was touched and said of course! From there, the \"prayer\" mailing list grew to over 300 co-workers and friends. (Thank goodness computers came along!) May you flutter by others as you have fluttered by me.",
        "industryIdentifiers": [
          {
            "type": "ISBN_13",
            "identifier": "9781598587920"
          },
          {
            "type": "ISBN_10",
            "identifier": "1598587927"
          }
        ],
        "readingModes": {
          "text": true,
          "image": true
        },
        "pageCount": 292,
        "printType": "BOOK",
        "categories": [
          "Reference"
        ],
        "maturityRating": "NOT_MATURE",
        "allowAnonLogging": false,
        "contentVersion": "0.1.2.0.preview.3",
        "panelizationSummary": {
          "containsEpubBubbles": false,
          "containsImageBubbles": false
        },
        "imageLinks": {
          "smallThumbnail": "http://books.google.com/books/content?id=mgAnvUmqhfUC&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api",
          "thumbnail": "http://books.google.com/books/content?id=mgAnvUmqhfUC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api"
        },
        "language": "en",
        "previewLink": "http://books.google.com.br/books?id=mgAnvUmqhfUC&pg=PA289&dq=flutter&hl=&cd=5&source=gbs_api",
        "infoLink": "https://play.google.com/store/books/details?id=mgAnvUmqhfUC&source=gbs_api",
        "canonicalVolumeLink": "https://play.google.com/store/books/details?id=mgAnvUmqhfUC"
      },
      "saleInfo": {
        "country": "BR",
        "saleability": "FOR_SALE",
        "isEbook": true,
        "listPrice": {
          "amount": 71.61,
          "currencyCode": "BRL"
        },
        "retailPrice": {
          "amount": 71.61,
          "currencyCode": "BRL"
        },
        "buyLink": "https://play.google.com/store/books/details?id=mgAnvUmqhfUC&rdid=book-mgAnvUmqhfUC&rdot=1&source=gbs_api",
        "offers": [
          {
            "finskyOfferType": 1,
            "listPrice": {
              "amountInMicros": 71610000,
              "currencyCode": "BRL"
            },
            "retailPrice": {
              "amountInMicros": 71610000,
              "currencyCode": "BRL"
            },
            "giftable": true
          }
        ]
      },
      "accessInfo": {
        "country": "BR",
        "viewability": "PARTIAL",
        "embeddable": true,
        "publicDomain": false,
        "textToSpeechPermission": "ALLOWED",
        "epub": {
          "isAvailable": true,
          "acsTokenLink": "http://books.google.com.br/books/download/Flutter_by-sample-epub.acsm?id=mgAnvUmqhfUC&format=epub&output=acs4_fulfillment_token&dl_type=sample&source=gbs_api"
        },
        "pdf": {
          "isAvailable": true,
          "acsTokenLink": "http://books.google.com.br/books/download/Flutter_by-sample-pdf.acsm?id=mgAnvUmqhfUC&format=pdf&output=acs4_fulfillment_token&dl_type=sample&source=gbs_api"
        },
        "webReaderLink": "http://play.google.com/books/reader?id=mgAnvUmqhfUC&hl=&printsec=frontcover&source=gbs_api",
        "accessViewStatus": "SAMPLE",
        "quoteSharingAllowed": false
      }
    },
    {
      "kind": "books#volume",
      "id": "pF6vDwAAQBAJ",
      "etag": "Z+BThi5FBUQ",
      "selfLink": "https://www.googleapis.com/books/v1/volumes/pF6vDwAAQBAJ",
      "volumeInfo": {
        "title": "Flutter for Beginners",
        "subtitle": "An introductory guide to building cross-platform mobile applications with Flutter and Dart 2",
        "authors": [
          "Alessandro Biessek"
        ],
        "publisher": "Packt Publishing Ltd",
        "publishedDate": "2019-09-12",
        "description": "A step-by-step guide to learning Flutter and Dart 2 for creating Android and iOS mobile applications Key Features Get up to speed with the basics of Dart programming and delve into Flutter development Understand native SDK and third-party libraries for building Android and iOS applications using Flutter Package and deploy your Flutter apps to achieve native-like performance Book Description Google Flutter is a cross-platform mobile framework that makes it easy to write high-performance apps for Android and iOS. This book will help you get to grips with the basics of the Flutter framework and the Dart programming language. Starting from setting up your development environment, you’ll learn to design the UI and add user input functions. You'll explore the navigator widget to manage app routes and learn to add transitions between screens. The book will even guide you through developing your own plugin and later, you’ll discover how to structure good plugin code. Using the Google Places API, you'll also understand how to display a map in the app and add markers and interactions to it. You’ll then learn to improve the user experience with features such as map integrations, platform-specific code with native languages, and personalized animation options for designing intuitive UIs. The book follows a practical approach and gives you access to all relevant code files hosted at github.com/PacktPublishing/Flutter-for-Beginners. This will help you access a variety of examples and prepare your own bug-free apps, ready to deploy on the App Store and Google Play Store. By the end of this book, you’ll be well-versed with Dart programming and have the skills to develop your own mobile apps or build a career as a Dart and Flutter app developer. What you will learn Understand the fundamentals of the Dart programming language Explore the core concepts of the Flutter UI and how it compiles for multiple platforms Develop Flutter plugins and widgets and understand how to structure plugin code appropriately Style your Android and iOS apps with widgets and learn the difference between stateful and stateless widgets Add animation to your UI using Flutter's AnimatedBuilder component Integrate your native code into your Flutter codebase for native app performance Who this book is for This book is for developers looking to learn Google's revolutionary framework Flutter from scratch. No prior knowledge of Flutter or Dart is required; however, basic knowledge of any programming language will be helpful.",
        "industryIdentifiers": [
          {
            "type": "ISBN_13",
            "identifier": "9781788990523"
          },
          {
            "type": "ISBN_10",
            "identifier": "1788990528"
          }
        ],
        "readingModes": {
          "text": true,
          "image": true
        },
        "pageCount": 512,
        "printType": "BOOK",
        "categories": [
          "Computers"
        ],
        "maturityRating": "NOT_MATURE",
        "allowAnonLogging": true,
        "contentVersion": "1.3.3.0.preview.3",
        "panelizationSummary": {
          "containsEpubBubbles": false,
          "containsImageBubbles": false
        },
        "imageLinks": {
          "smallThumbnail": "http://books.google.com/books/content?id=pF6vDwAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api",
          "thumbnail": "http://books.google.com/books/content?id=pF6vDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api"
        },
        "language": "en",
        "previewLink": "http://books.google.com.br/books?id=pF6vDwAAQBAJ&pg=PA473&dq=flutter&hl=&cd=6&source=gbs_api",
        "infoLink": "https://play.google.com/store/books/details?id=pF6vDwAAQBAJ&source=gbs_api",
        "canonicalVolumeLink": "https://play.google.com/store/books/details?id=pF6vDwAAQBAJ"
      },
      "saleInfo": {
        "country": "BR",
        "saleability": "FOR_SALE",
        "isEbook": true,
        "listPrice": {
          "amount": 94.99,
          "currencyCode": "BRL"
        },
        "retailPrice": {
          "amount": 94.99,
          "currencyCode": "BRL"
        },
        "buyLink": "https://play.google.com/store/books/details?id=pF6vDwAAQBAJ&rdid=book-pF6vDwAAQBAJ&rdot=1&source=gbs_api",
        "offers": [
          {
            "finskyOfferType": 1,
            "listPrice": {
              "amountInMicros": 94990000,
              "currencyCode": "BRL"
            },
            "retailPrice": {
              "amountInMicros": 94990000,
              "currencyCode": "BRL"
            },
            "giftable": true
          }
        ]
      },
      "accessInfo": {
        "country": "BR",
        "viewability": "PARTIAL",
        "embeddable": true,
        "publicDomain": false,
        "textToSpeechPermission": "ALLOWED",
        "epub": {
          "isAvailable": true
        },
        "pdf": {
          "isAvailable": true
        },
        "webReaderLink": "http://play.google.com/books/reader?id=pF6vDwAAQBAJ&hl=&printsec=frontcover&source=gbs_api",
        "accessViewStatus": "SAMPLE",
        "quoteSharingAllowed": false
      },
      "searchInfo": {
        "textSnippet": "Dart packages 296 plugin packages 296 plugin packages, creating 298 \u003cbr\u003e\nreference link 307 versus Dart package 296 \u003cb\u003eFlutter\u003c/b\u003e rendering about 105, 108 \u003cbr\u003e\nframework 107 OEM widgets 107 web-based technologies 106 \u003cb\u003eFlutter\u003c/b\u003e repository-\u003cbr\u003e\nrelated&nbsp;..."
      }
    },
    {
      "kind": "books#volume",
      "id": "6kD1EgYmg0YC",
      "etag": "PhX4bjZZaAs",
      "selfLink": "https://www.googleapis.com/books/v1/volumes/6kD1EgYmg0YC",
      "volumeInfo": {
        "title": "Flutter Investigation of a True-speed Dynamic Model with Various Tip-tank Configurations",
        "authors": [
          "John L. Sewall"
        ],
        "publishedDate": "1960",
        "industryIdentifiers": [
          {
            "type": "OTHER",
            "identifier": "UIUC:30112106590224"
          }
        ],
        "readingModes": {
          "text": false,
          "image": true
        },
        "pageCount": 80,
        "printType": "BOOK",
        "categories": [
          "Vibration"
        ],
        "maturityRating": "NOT_MATURE",
        "allowAnonLogging": false,
        "contentVersion": "0.1.1.0.full.1",
        "panelizationSummary": {
          "containsEpubBubbles": false,
          "containsImageBubbles": false
        },
        "imageLinks": {
          "smallThumbnail": "http://books.google.com/books/content?id=6kD1EgYmg0YC&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api",
          "thumbnail": "http://books.google.com/books/content?id=6kD1EgYmg0YC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api"
        },
        "language": "en",
        "previewLink": "http://books.google.com.br/books?id=6kD1EgYmg0YC&pg=PA36&dq=flutter&hl=&cd=7&source=gbs_api",
        "infoLink": "https://play.google.com/store/books/details?id=6kD1EgYmg0YC&source=gbs_api",
        "canonicalVolumeLink": "https://play.google.com/store/books/details?id=6kD1EgYmg0YC"
      },
      "saleInfo": {
        "country": "BR",
        "saleability": "FREE",
        "isEbook": true,
        "buyLink": "https://play.google.com/store/books/details?id=6kD1EgYmg0YC&rdid=book-6kD1EgYmg0YC&rdot=1&source=gbs_api"
      },
      "accessInfo": {
        "country": "BR",
        "viewability": "ALL_PAGES",
        "embeddable": true,
        "publicDomain": true,
        "textToSpeechPermission": "ALLOWED",
        "epub": {
          "isAvailable": false,
          "downloadLink": "http://books.google.com.br/books/download/Flutter_Investigation_of_a_True_speed_Dy.epub?id=6kD1EgYmg0YC&hl=&output=epub&source=gbs_api"
        },
        "pdf": {
          "isAvailable": false
        },
        "webReaderLink": "http://play.google.com/books/reader?id=6kD1EgYmg0YC&hl=&printsec=frontcover&source=gbs_api",
        "accessViewStatus": "FULL_PUBLIC_DOMAIN",
        "quoteSharingAllowed": false
      },
      "searchInfo": {
        "textSnippet": "Aerodynamic data Frequency data Violent \u003cb\u003eflutter\u003c/b\u003e ; symmetric mode involving \u003cbr\u003e\nfuselage translation 22 A - .82-1.02 -.38 .85 939 .001516 3.9 No \u003cb\u003eflutter\u003c/b\u003e -3.07 A - .\u003cbr\u003e\n82-1.02 .651 709 .001873 3.7 A - .82-1.02 .002132 3.1 18.05 15.1 14.9 17.15 25 \u003cbr\u003e\nA&nbsp;..."
      }
    },
    {
      "kind": "books#volume",
      "id": "W4pIzQEACAAJ",
      "etag": "lgf9jq+cjqk",
      "selfLink": "https://www.googleapis.com/books/v1/volumes/W4pIzQEACAAJ",
      "volumeInfo": {
        "title": "Learn Flutter and Dart to Build IOS and Android Apps",
        "authors": [
          "Maximilian Schwarzmüller"
        ],
        "publishedDate": "2018",
        "description": "\"This course will teach you Flutter and Dart from scratch. With Flutter, you'll be able to write code only once and ship your apps both to the Apple AppStore and Google Play. Use Google's Material Design to build beautiful yet fully customizable apps in no time with almost zero effort. You can use the rich widget suite Flutter provides to add common UI elements such as buttons, switches, forms, toolbars, lists, and more--or simply build your own widgets--Flutter makes that a breeze too. You're interested in building real native mobile apps for the two most popular mobile platforms - iOS and Android. You want to explore the full set of features Flutter offers. Don't want to spend hours learning two completely different languages.\"--Resource description page.",
        "industryIdentifiers": [
          {
            "type": "OTHER",
            "identifier": "OCLC:1137154547"
          }
        ],
        "readingModes": {
          "text": false,
          "image": false
        },
        "printType": "BOOK",
        "maturityRating": "NOT_MATURE",
        "allowAnonLogging": false,
        "contentVersion": "preview-1.0.0",
        "panelizationSummary": {
          "containsEpubBubbles": false,
          "containsImageBubbles": false
        },
        "language": "en",
        "previewLink": "http://books.google.com.br/books?id=W4pIzQEACAAJ&dq=flutter&hl=&cd=8&source=gbs_api",
        "infoLink": "http://books.google.com.br/books?id=W4pIzQEACAAJ&dq=flutter&hl=&source=gbs_api",
        "canonicalVolumeLink": "https://books.google.com/books/about/Learn_Flutter_and_Dart_to_Build_IOS_and.html?hl=&id=W4pIzQEACAAJ"
      },
      "saleInfo": {
        "country": "BR",
        "saleability": "NOT_FOR_SALE",
        "isEbook": false
      },
      "accessInfo": {
        "country": "BR",
        "viewability": "NO_PAGES",
        "embeddable": false,
        "publicDomain": false,
        "textToSpeechPermission": "ALLOWED",
        "epub": {
          "isAvailable": false
        },
        "pdf": {
          "isAvailable": false
        },
        "webReaderLink": "http://play.google.com/books/reader?id=W4pIzQEACAAJ&hl=&printsec=frontcover&source=gbs_api",
        "accessViewStatus": "NONE",
        "quoteSharingAllowed": false
      },
      "searchInfo": {
        "textSnippet": "&quot;This course will teach you Flutter and Dart from scratch."
      }
    },
    {
      "kind": "books#volume",
      "id": "LtYgtyrTymAC",
      "etag": "0Q3CMf35jB8",
      "selfLink": "https://www.googleapis.com/books/v1/volumes/LtYgtyrTymAC",
      "volumeInfo": {
        "title": "Flutter",
        "authors": [
          "Melissa Andrea"
        ],
        "publisher": "Melissa Andrea Henderson",
        "publishedDate": "2012-11-05",
        "description": "SaraSara's life is forever changed - Waking up, buried & hidden deeply in the last place anyone would want to be, will do that. She is determined to find out how she ended up there & why, but when the only person who can help her, continuously lies to her, she finds herself forced to suffer alone. She can't ignore the strange things that begin to happen to her nor can she hide from the nightmares that haunt her sleep. And when her world collides with Adan - the mysterious boy whom she can't seem to stay away from, literally - she is consumed by the flutter that sparks whenever he is around and she is desperate to discover the reason why. AdanAdan's mission to find Sara has finally begun - It seemed simple: bring her back to the enchanted world that lives, breathes and survives because of her, but he quickly finds himself faced with an entirely new challenge. Immediately, Adan realizes that staying unknown to Sara is a task he will fail before he even begins; the pull to her is far too strong to refuse, but being with her will defy the very reason he existed. He is the key to her survival and being with her is not part of the path that he was born to follow. Can he find it in himself too resist the urge to be with or will he destroy everything that had been left to Sara to protect and defend.FlutterAs Sara and Adan struggle to overcome their own separate battles - There is a far more determined evil that is stalking the shadows and waiting to annihilate them both. Together they will fight to change the rules and rewrite their fate.",
        "readingModes": {
          "text": false,
          "image": true
        },
        "pageCount": 442,
        "printType": "BOOK",
        "categories": [
          "Fantasy fiction"
        ],
        "averageRating": 2.5,
        "ratingsCount": 4,
        "maturityRating": "NOT_MATURE",
        "allowAnonLogging": false,
        "contentVersion": "preview-1.0.0",
        "imageLinks": {
          "smallThumbnail": "http://books.google.com/books/content?id=LtYgtyrTymAC&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api",
          "thumbnail": "http://books.google.com/books/content?id=LtYgtyrTymAC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api"
        },
        "language": "en",
        "previewLink": "http://books.google.com.br/books?id=LtYgtyrTymAC&pg=PA87&dq=flutter&hl=&cd=9&source=gbs_api",
        "infoLink": "http://books.google.com.br/books?id=LtYgtyrTymAC&dq=flutter&hl=&source=gbs_api",
        "canonicalVolumeLink": "https://books.google.com/books/about/Flutter.html?hl=&id=LtYgtyrTymAC"
      },
      "saleInfo": {
        "country": "BR",
        "saleability": "NOT_FOR_SALE",
        "isEbook": false
      },
      "accessInfo": {
        "country": "BR",
        "viewability": "PARTIAL",
        "embeddable": true,
        "publicDomain": false,
        "textToSpeechPermission": "ALLOWED",
        "epub": {
          "isAvailable": false
        },
        "pdf": {
          "isAvailable": false
        },
        "webReaderLink": "http://play.google.com/books/reader?id=LtYgtyrTymAC&hl=&printsec=frontcover&source=gbs_api",
        "accessViewStatus": "SAMPLE",
        "quoteSharingAllowed": false
      },
      "searchInfo": {
        "textSnippet": "... few yards to the shed by thinking about something else; I would probably be \u003cbr\u003e\nless clumsy that way. I knew what 87 \u003cb\u003eFlutter\u003c/b\u003e."
      }
    },
    {
      "kind": "books#volume",
      "id": "FXL3iRgo2IkC",
      "etag": "QhrXJlnTU4Q",
      "selfLink": "https://www.googleapis.com/books/v1/volumes/FXL3iRgo2IkC",
      "volumeInfo": {
        "title": "Flutter",
        "subtitle": "The Story of Four Sisters and an Incredible Journey",
        "authors": [
          "Erin E. Moulton"
        ],
        "publisher": "Penguin",
        "publishedDate": "2011-05-12",
        "description": "A “page-turner of a survival story.” –School Library Journal Big things are about to happen at Maple's house. Mama's going to have a baby, which means now there will be four Rittle sisters instead of just three. But when baby Lily is born too early and can't come home from the hospital, Maple knows it's up to her to save her sister. So she and Dawn, armed with a map and some leftover dinner, head off down a river and up a mountain to find the Wise Woman who can grant miracles. Now it's not only Lily's survival that they have to worry about, but also their own. The dangers that Maple and Dawn encounter on their journey makes them realize a thing or two about miracles-and about each other. Praise for FLUTTER “Moulton is an author to watch, and her debut novel will appeal to girls Maple's age who prefer action to character realism.” –Booklist “Moulton's charming debut explores the challenges and rewards of sisterhood….[in] a heartfelt tale of familial love, with just a touch of magic.” –Publishers Weekly",
        "industryIdentifiers": [
          {
            "type": "ISBN_13",
            "identifier": "9781101515068"
          },
          {
            "type": "ISBN_10",
            "identifier": "1101515066"
          }
        ],
        "readingModes": {
          "text": true,
          "image": false
        },
        "pageCount": 208,
        "printType": "BOOK",
        "categories": [
          "Juvenile Fiction"
        ],
        "averageRating": 5,
        "ratingsCount": 1,
        "maturityRating": "NOT_MATURE",
        "allowAnonLogging": true,
        "contentVersion": "0.2.4.0.preview.2",
        "panelizationSummary": {
          "containsEpubBubbles": false,
          "containsImageBubbles": false
        },
        "imageLinks": {
          "smallThumbnail": "http://books.google.com/books/content?id=FXL3iRgo2IkC&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api",
          "thumbnail": "http://books.google.com/books/content?id=FXL3iRgo2IkC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api"
        },
        "language": "en",
        "previewLink": "http://books.google.com.br/books?id=FXL3iRgo2IkC&pg=PT39&dq=flutter&hl=&cd=10&source=gbs_api",
        "infoLink": "https://play.google.com/store/books/details?id=FXL3iRgo2IkC&source=gbs_api",
        "canonicalVolumeLink": "https://play.google.com/store/books/details?id=FXL3iRgo2IkC"
      },
      "saleInfo": {
        "country": "BR",
        "saleability": "FOR_SALE",
        "isEbook": true,
        "listPrice": {
          "amount": 39.09,
          "currencyCode": "BRL"
        },
        "retailPrice": {
          "amount": 39.09,
          "currencyCode": "BRL"
        },
        "buyLink": "https://play.google.com/store/books/details?id=FXL3iRgo2IkC&rdid=book-FXL3iRgo2IkC&rdot=1&source=gbs_api",
        "offers": [
          {
            "finskyOfferType": 1,
            "listPrice": {
              "amountInMicros": 39090000,
              "currencyCode": "BRL"
            },
            "retailPrice": {
              "amountInMicros": 39090000,
              "currencyCode": "BRL"
            },
            "giftable": true
          }
        ]
      },
      "accessInfo": {
        "country": "BR",
        "viewability": "PARTIAL",
        "embeddable": true,
        "publicDomain": false,
        "textToSpeechPermission": "ALLOWED_FOR_ACCESSIBILITY",
        "epub": {
          "isAvailable": true,
          "acsTokenLink": "http://books.google.com.br/books/download/Flutter-sample-epub.acsm?id=FXL3iRgo2IkC&format=epub&output=acs4_fulfillment_token&dl_type=sample&source=gbs_api"
        },
        "pdf": {
          "isAvailable": false
        },
        "webReaderLink": "http://play.google.com/books/reader?id=FXL3iRgo2IkC&hl=&printsec=frontcover&source=gbs_api",
        "accessViewStatus": "SAMPLE",
        "quoteSharingAllowed": false
      }
    }
  ]
};