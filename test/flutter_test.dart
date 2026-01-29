import 'package:ecommerce_app/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('App starts without crashing', (tester) async {
    await tester.pumpWidget(const MyApp(isLoggedIn: false));
    expect(find.byType(MyApp), findsOneWidget);
  });
}
