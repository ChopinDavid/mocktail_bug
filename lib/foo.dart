import 'package:mocktail/mocktail.dart';
import 'package:mocktail_bug/bar.dart';

class Foo {
  Bar getBar() {
    return Bar();
  }
}

class MockFoo extends Mock implements Foo {}
