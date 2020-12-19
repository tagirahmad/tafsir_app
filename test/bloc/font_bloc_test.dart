import 'package:bloc_test/bloc_test.dart';
import 'package:tafsir_albaqara/bloc/font_bloc/font_size_bloc.dart';
import 'package:test/test.dart';

class MockFontSizeBloc extends MockBloc<FontSizeEvent, FontSizeState> implements FontSizeBloc {}

void main() {
  group('FontSizeBloc', () {
    MockFontSizeBloc fontSizeBloc;

    setUp(() {
      fontSizeBloc = MockFontSizeBloc();
    });

    tearDown(() {
      fontSizeBloc.close();
    });

    test('initial state of FontSizeBloc is FontSizeInitial()', () {
      expect(fontSizeBloc.state, const FontSizeInitial());
    });

    blocTest<MockFontSizeBloc, FontSizeEvent, FontSizeState>(
        'FontSizeBloc should yield FontSizeLoadSuccess(fontSize: fs) when AppStarted',
        build: () async => fontSizeBloc,
        act: (MockFontSizeBloc bloc) async =>  bloc.add(AppStarted()),
        expect: <FontSizeState>[const FontSizeLoadSuccess(fontSize: 15)]);

    // blocTest("FontSizeBloc should yield FontSizeLoadSuccess(fontSize: fontSize) when ", build: null)
  });
}
