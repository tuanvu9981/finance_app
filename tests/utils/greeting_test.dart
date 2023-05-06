import 'package:finance_app/utils/greeting.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // A single test with time now (16:16)
  // test('Check if greeting is true', () {
  //   var value = buildGreeting();
  //   expect(value, 'Good afternoon');
  // });

  group('Check if with argument value, greeting is true or not', () {
    test('Hour is 3', () {
      var hourIs3 = DateTime(2023, 9, 7, 3);
      expect(buildGreetingWithParams(hourIs3.hour), 'Good night');
    });

    test('Hour is 10', () {
      var hourIs10 = DateTime(2023, 9, 7, 10);
      // true: expect(buildGreetingWithParams(hourIs10.hour), 'Good morning');
      expect(buildGreetingWithParams(hourIs10.hour), 'Good afternoon');
    });
  });
}
