import 'package:contact_db/modal/contactmodel.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
const String columnId = 'id';
const String columnName = 'name';
const String columnNumber = 'number';
const String columnImage = 'url';
const String contactTable = 'todo_table';
class DbHelper {
  static final DbHelper instance = DbHelper.internal();

  factory DbHelper(){
    return instance;
  }

  DbHelper.internal();

  late Database db;

  Future opendatabase() async {
    var databasesPath = await getDatabasesPath();
    String path = await join(databasesPath, 'db_contact');
    db = await openDatabase(path, version: 1,
        onCreate: (Database db, int v) async {
          db.execute(
              'create table $contactTable($columnId integer primary key autoincrement,$columnName text not null,$columnNumber integer not null,$columnImage text not null)');
        });
  }

  Future<ContactModel> addcontact(ContactModel contact) async {
    db.insert(contactTable, contact.tomap());
    return contact;
  }

  Future<List<ContactModel>> allcontacts() async {
    List<Map<String, dynamic>>contactmaps = await db.query(contactTable);
    if (contactmaps.length == 0) {
      return [];
    }
    else {
      List<ContactModel>AllContacts = [];
      contactmaps.forEach((element) {
        AllContacts.add(ContactModel.frommap(element));
      });
      return AllContacts;
    }
  }

  Future<int> removetodo(int id) async {
    return await db.delete(
      contactTable,
      where: 'Id?',
      whereArgs: [id],
    );
  }

  Future<int> courseUpdate(ContactModel contact) async {
    return await db.update(contactTable, contact.tomap(), where: columnId + '?',
        whereArgs: [contact.id]);
  }
}