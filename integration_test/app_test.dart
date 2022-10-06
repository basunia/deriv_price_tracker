import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:price_tracker/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets('tap on the floating action button, verify dropdown widget',
        (tester) async {
      app.main();
      await tester.pumpAndSettle();

      // Verify that loads data in the dropdown.
      expect(find.text('Select a Market'), findsOneWidget);
    });
  });
}
