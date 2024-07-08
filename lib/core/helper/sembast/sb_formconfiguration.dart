import 'package:flavordinamico/core/helper/database_services.dart';
import 'package:flavordinamico/core/helper/sembast/sembast_database.dart';
import 'package:flavordinamico/model/form_configuration_entity.dart';
import 'package:sembast/sembast.dart';

class FormConfigurationStoreSB implements DatabaseService<FormConfiguration> {
  
  final String storeName = 'formconfiguration';
   
  @override
  Future<int> delete(int id) async {
    final store = intMapStoreFactory.store(storeName);
    final finder = Finder(filter: Filter.byKey(id));
    
    return await store.delete(await DatabaseSembast.instance.database, finder: finder);
  }

  @override
  Future<List<FormConfiguration>> getAll() async {
    final store = intMapStoreFactory.store(storeName);
    final snapshot = await store.find(await DatabaseSembast.instance.database);
    
    return  snapshot.map((record) => FormConfiguration.fromMap(record.value)).toList();
  }

  @override
  Future<int> insert(FormConfiguration item) async {
    final store = intMapStoreFactory.store(storeName);
    return await store.add(await DatabaseSembast.instance.database, item.toMap());
  }

  @override
  Future<List<FormConfiguration>> query(String sql, [List? arguments]) async {    
    final store = intMapStoreFactory.store(storeName);    
    
    if (arguments != null) {
      final finder = Finder(
        filter: Filter.custom((record) {
          return record['name'] == arguments[0]; 
        }),
      );
      final snapshot = await store.find(await DatabaseSembast.instance.database, finder: finder);
      return snapshot.map((record) => FormConfiguration.fromMap(record.value)).toList();      
    } else {
      final snapshot = await store.find(await DatabaseSembast.instance.database,);

      return snapshot.map((record) => FormConfiguration.fromMap(record.value)).toList();          
    }

  }

  @override
  Future<int> update(FormConfiguration item) async {
    final store = intMapStoreFactory.store(storeName);
    final finder = Finder(filter: Filter.byKey(item.id));
    return await store.update(await DatabaseSembast.instance.database, item.toMap(), finder: finder);
  }
  
  

}