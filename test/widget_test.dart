import 'package:flutter_test/flutter_test.dart';
import 'package:nova_ai_chat/main.dart';

void main() {
  testWidgets('App renders Basic AI Chat title', (WidgetTester tester) async {
    await tester.pumpWidget(const BasicAIApp());
    expect(find.text('Basic AI Chat'), findsWidgets);
  });
}
