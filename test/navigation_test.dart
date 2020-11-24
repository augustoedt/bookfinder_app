import 'package:flutter/material.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';


class MockNavigationObserver extends Mock implements NavigatorObserver{}

void main(){
  group('BookFinderNavigationTest', (){
    NavigatorObserver mockObserver;
    setUp((){
      mockObserver =  MockNavigationObserver();
    });

    Future<void> _buildMainPage(WidgetTester tester) async{
      await tester.pumpWidget(MaterialApp(
          home: Container(),
          navigatorObservers: [mockObserver],
      ));

      verify(mockObserver.didPush(any, any));
    }

    Future<void> _navigateToDetailPage(WidgetTester tester) async {
      await tester.tap(find.byKey(any));
    }
  });
}