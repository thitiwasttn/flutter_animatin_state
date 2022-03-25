class MySingleton {
  int _counter = 0;

  //private constructor
  MySingleton._myConstructor();

  static MySingleton instance = MySingleton._myConstructor();

  void increase() {
    _counter = _counter + 1;
  }

  void decrease() {
    _counter = _counter - 1;
  }

  int getCounter() {
    return _counter;
  }
}
