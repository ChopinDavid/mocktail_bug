import 'dart:async';

import 'package:mocktail/mocktail.dart';

class Bar implements Future<int> {
  @override
  Stream<int> asStream() {
    // TODO: implement asStream
    throw UnimplementedError();
  }

  @override
  Future<int> catchError(Function onError,
      {bool Function(Object error)? test}) {
    // TODO: implement catchError
    throw UnimplementedError();
  }

  @override
  Future<R> then<R>(FutureOr<R> Function(int value) onValue,
      {Function? onError}) {
    // TODO: implement then
    throw UnimplementedError();
  }

  @override
  Future<int> timeout(Duration timeLimit,
      {FutureOr<int> Function()? onTimeout}) {
    // TODO: implement timeout
    throw UnimplementedError();
  }

  @override
  Future<int> whenComplete(FutureOr<void> Function() action) {
    // TODO: implement whenComplete
    throw UnimplementedError();
  }
}

class MockBar extends Mock implements Bar {
  // If this is method is not overridden, we get the "type 'Null' is not a subtype of type 'Future<dynamic>'" runtime error
  @override
  Future<R> then<R>(FutureOr<R> Function(int value) onValue,
      {Function? onError}) {
    return Future.value();
  }
}
