import 'package:sqflite/sqflite.dart';
import 'package:tr_task/core/helper/logger.dart';
import 'package:tr_task/features/cart/data/cart_model.dart';

class LocalStorage{

  String tableName = "cart";

  Database? database;

  Future<void> init() async{

    String databasePath = await getDatabasesPath();

    await openDatabase(
        databasePath+"/"+"cart_db",
        version: 1,
        onCreate: (db,version) async{
          String sqlQuery = "CREATE TABLE $tableName (id INTEGER PRIMARY KEY, name TEXT, price INTEGER, image_url TEXT, count INTEGER)";
          await db.execute(sqlQuery);
          database = db;
        },
        onOpen: (db){
          database = db;
        },

        onUpgrade: (db,oldVersion,newVersion){
          database = db;
        }
    );

  }

  Future<bool> addCart(Cart cart) async{
    int? isInserted =  await database?.insert(tableName, cart.toJson());
    logger.d(isInserted);
    if (isInserted != null) {
      // Insertion was successful, and isInserted contains the ID of the inserted row
      return true;
    } else {
      // Insertion failed
      return false;
    }
  }

  Future<List<Cart>> fetchAllCarts() async {
    List<Map<String, Object?>>? mapList = await database?.query(tableName);
    List<Cart> cartList = [];

    if (mapList != null) {
      for (Map<String, Object?> item in mapList) {
        cartList.add(Cart.fromJson(item));
      }
    } else {

      // Handle the case where mapList is null
      // For example, you could log an error message or throw an exception
      print('Error: mapList is null');
      return cartList;
       throw Exception('mapList is null'); // Uncomment this line to throw an exception
    }

    return cartList;
  }




  Future<void> delete(int id) async {
    await database?.delete(tableName, where: 'id = ?', whereArgs: [id]);
  }

  Future<void> update(Cart cart) async {
    await database?.update(tableName, cart.toJson(),
        where: 'id = ?', whereArgs: [cart.id]);
  }


}