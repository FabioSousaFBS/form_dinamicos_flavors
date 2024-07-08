import 'package:flavordinamico/core/helper/database_services.dart';
import 'package:flavordinamico/core/helper/sembast/sembast_database.dart';
import 'package:flavordinamico/model/produto_model.dart';
import 'package:sembast/sembast.dart';

class ProdutoStoreSB implements DatabaseService<Produto>{

  final String storeName = 'produtos';

  final Future<Database> _database = DatabaseSembast.instance.database; 
  
  Future<Database> get database async => await _database;

  @override
  Future<int> delete(int id) async {
    final store = intMapStoreFactory.store(storeName);
    final finder = Finder(filter: Filter.byKey(id));
    return await store.delete(await database, finder: finder);
  }
  
  @override
  Future<List<Produto>> getAll() async {
     final store = intMapStoreFactory.store(storeName);
    final snapshot = await store.find(await _database);
    
    return snapshot.map((record) => Produto.fromMap(record.value)).toList();
  }
  
  @override
  Future<int> insert(Produto item) async {
    final store = intMapStoreFactory.store(storeName);
    return await store.add(await _database, item.toMap());
  }
  
  @override
  Future<List<Produto>> query(String sql, [List? arguments]) async {
    final store = intMapStoreFactory.store(storeName);    
    
    if (arguments != null) {
      final finder = Finder(
        filter: Filter.custom((record) {
          return record['description'] == arguments[0]; 
        }),
      );
      final snapshot = await store.find(await _database, finder: finder);
      return snapshot.map((record) => Produto.fromMap(record.value)).toList();      
    } else {
      final snapshot = await store.find(await _database);

      return snapshot.map((record) => Produto.fromMap(record.value)).toList();          
    }
  }
  
  @override
  Future<int> update(Produto item) async {
    final store = intMapStoreFactory.store(storeName);
    final finder = Finder(filter: Filter.byKey(item.id));
    return await store.update(await _database, item.toMap(), finder: finder);
  }


}