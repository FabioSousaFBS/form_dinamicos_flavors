abstract class DatabaseService<T> {

  Future<int> insert(T item);
  Future<List<T>> getAll();
  Future<int> update(T item);
  Future<int> delete(int id);
  Future<List<T>> query(String sql, [List<dynamic> arguments]);

}


