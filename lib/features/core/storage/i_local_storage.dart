abstract class ILocalStorage {
  Future<void> save<T>(String key, T value);
  T? read<T>(String key);
  Future<void> remove(String key);
}
