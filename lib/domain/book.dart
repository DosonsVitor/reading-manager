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
    _name = json['name'];
    _author = json['author'];
    _description = json['description'];
    _pages = json['pages'];
    _pagesRead = json['pages_read'];
    _status = json['status_id'];
  }

  Map<String, Object?> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['id'] = _id.v4().toString();
    data['name'] = _name;
    data['author'] = _author;
    data['description'] = _description;
    data['pages'] = _pages;
    data['pages_read'] = _pagesRead;
    data['status_id'] = _status;

    return data;
  }

  Book.fromBookInfo(books_finder.Book book){
    _name = '${book.info.title}: ${book.info.subtitle}';
    _author = book.info.authors[0];
    _description = book.info.description;
    _pages = book.info.pageCount;
  }

  String get id => _id.v4().toString();

  String get name => _name;

  String get author => _author;

  String get description => _description;

  int get pages => _pages;

  int get pagesRead => _pagesRead;

  int get status => _status;
}

