// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:price_tracker/app.dart';
import 'package:price_tracker/service_locator.dart';

void main() {
  group('Widget test', () {
    testWidgets('Price tracker smoke test', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      final service = ServiceLocator();
      await dotenv.load(fileName: ".env");
      await tester.pumpWidget(PriceTrackerApp(repostory: service.repository));

      expect(find.text('Select a Market'), findsOneWidget);
    });

    testWidgets('finds Select an Asset in the widget', (tester) async {
      // Build our app and trigger a frame.
      final service = ServiceLocator();
      await dotenv.load(fileName: ".env");
      await tester.pumpWidget(PriceTrackerApp(repostory: service.repository));

      await tester.tap(find.text('Select a Market'));
      await tester.pump();

      expect(find.text('Select an Asset'), findsOneWidget);
    });
  });
}
