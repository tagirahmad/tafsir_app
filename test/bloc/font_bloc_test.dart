import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart' as flutter_test;
import 'package:tafsir_albaqara/bloc/font_bloc/font_size_bloc.dart';
import 'package:test/test.dart';

class MockFontSizeBloc extends MockBloc<FontSizeState> implements FontSizeBloc {}

void main() {
  flutter_test.TestWidgetsFlutterBinding.ensureInitialized();
  group('FontSizeBloc', () {
    // MockFontSizeBloc fontSizeBloc;
    FontSizeBloc fontSizeBloc;

    setUp(() {
      // fontSizeBloc = MockFontSizeBloc(const FontSizeInitial());
      fontSizeBloc = FontSizeBloc(const FontSizeInitial());
    });

    tearDown(() {
      fontSizeBloc.close();
    });

    test('initial state of FontSizeBloc is FontSizeInitial()', () {
      expect(fontSizeBloc.state, const FontSizeInitial());
    });

    blocTest<FontSizeBloc, FontSizeState>(
        'FontSizeBloc should yield FontSizeLoadSuccess(fontSize: fs) when AppStarted',
        build: () => fontSizeBloc,
        act: (dynamic bloc) => bloc.add(AppStarted()),
        expect: <FontSizeState>[const FontSizeLoadSuccess(fontSize: 15)]);
  });
}
