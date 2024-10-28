// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mocktail_bug/bar.dart';
import 'package:mocktail_bug/foo.dart';

void main() {
  late Foo mockFoo;

  setUp(() {
    mockFoo = MockFoo();
  });

  group('mocking a method that returns a value implementing Future', () {
    test('when using when.thenAnswer', () async {
      // Running this test currently hangs indefinitely
      // Removing the `then` override in `MockBar` makes it so we get a "type 'Null' is not a subtype of type 'Future<dynamic>'" runtime error
      when(() => mockFoo.getBar()).thenAnswer((_) => MockBar());
      await mockFoo.getBar();
    });

    test('when using when.thenAnswer with `async`', () async {
      // This test doesn't even build when the following line is uncommented
      // when(() => mockFoo.getBar()).thenAnswer((_) async => MockBar());
      await mockFoo.getBar();
    });

    test('when using when.thenReturn', () async {
      // Running this test gives us a "Invalid argument(s): `thenReturn` should not be used to return a Future. Instead, use `thenAnswer((_) => future)`." runtime error
      when(() => mockFoo.getBar()).thenReturn(MockBar());
      await mockFoo.getBar();
    });
  });
}
