import 'package:books_finder/books_finder.dart' as books_finder;
import 'package:uuid/uuid.dart';

class Book{
  late final Uuid _id;
  late final String _name;
  late final String _author;
  late final String _description;
  late final int _pages;
  late final int _pagesRead;
  late final int _status;

  Book({
    Uuid id = const Uuid(),
    required String name,
    required String author,
    String description = "",
    required int pages,
    int pagesRead = 0,
    int status = 1,
  }) : _status = status,
        _pagesRead = pagesRead,
        _pages = pages,
        _description = description,
        _author = author,
        _name = name,
        _id = id;

  Book.fromJson(Map<String, dynamic> json) {
    _id = Uuid.parse(json['id']) as Uuid;
    _name = json['nome'];
    _author = json['autor'];
    _description = json['sinopse'];
    _pages = json['paginas'];
    _pagesRead = json['paginas_lidas'];
    _status = json['status_id'];
  }

  Map<String, Object?> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['id'] = _id.v4().toString();
    data['nome'] = _name;
    data['autor'] = _author;
    data['sinopse'] = _description;
    data['paginas'] = _pages;
    data['paginas_lidas'] = _pagesRead;
    data['status_id'] = _status;

    return data;
  }

  Book.fromBookInfo(books_finder.Book book){
    _name = '${book.info.title}: ${book.info.subtitle}';
    _author = book.info.authors[0];
    _description = book.info.description;
    _pages = book.info.pageCount;
  }
}

