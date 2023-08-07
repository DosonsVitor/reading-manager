import 'package:sqflite/sqflite.dart';

import '../domain/book.dart';
import 'db_helper.dart';

class BookDao {

  addBook({required Book book}) async {
    DBHelper dbHelper = DBHelper();
    Database db = await dbHelper.initDB();

    await db.insert('BOOK', book.toJson());
  }

  Future<List<Book>> getAllBooks() async {
    DBHelper dbHelper = DBHelper();
    Database db = await dbHelper.initDB();

    String sql = 'SELECT * FROM BOOK;';
    var result = await db.rawQuery(sql);

    List<Book> allBooks = <Book>[];
    for (var json in result) {
      Book book = Book.fromJson(json);
      allBooks.add(book);
    }

    return allBooks;
  }

  Future<List<Book>> getBooksByStatus({required int statusId}) async {
    DBHelper dbHelper = DBHelper();
    Database db = await dbHelper.initDB();

    String sql = 'SELECT * FROM BOOK WHERE status_id = ?;';
    var result = await db.rawQuery(sql, [statusId]);

    List<Book> listBooks = <Book>[];
    for (var json in result) {
      Book book = Book.fromJson(json);
      listBooks.add(book);
    }

    return listBooks;
  }

  updateBook({required Book book}) async {
    DBHelper dbHelper = DBHelper();
    Database db = await dbHelper.initDB();

    String sql = 'UPDATE BOOK SET name = ?, author = ?, description = ?, pages = ?, pages_read = ?, status_id = ? WHERE id = ?;';
    
    await db.rawQuery(
        sql, [book.name,
          book.author,
          book.description,
          book.pages,
          book.pagesRead,
          book.status,
          book.id]);
  }

  changeStatus({required String bookId, required int statusId}) async {
    DBHelper dbHelper = DBHelper();
    Database db = await dbHelper.initDB();

    String sql = 'UPDATE BOOK SET status_id = ? WHERE id = ?;';

    await db.rawQuery(sql, [statusId, bookId]);
  }

  deleteBook({required String bookId}) async {
    DBHelper dbHelper = DBHelper();
    Database db = await dbHelper.initDB();

    String sql = 'DELETE FROM BOOK WHERE id = ?;';

    await db.rawQuery(sql, [bookId]);
  }
}