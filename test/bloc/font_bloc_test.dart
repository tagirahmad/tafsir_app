import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart' as flutter_test;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tafsir_albaqara/bloc/font_bloc/font_size_bloc.dart';
import 'package:test/test.dart';

void main() {
  flutter_test.TestWidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.setMockInitialValues(<String, dynamic>{});

  group('FontSizeBloc', () {
    FontSizeBloc fontSizeBloc;

    setUp(() {
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
      act: (FontSizeBloc bloc) => bloc.add(AppStarted()),
      expect: <FontSizeState>[const FontSizeLoadSuccess(fontSize: 15)],
    );

    blocTest<FontSizeBloc, FontSizeState>(
        'FontSizeBloc should yield FontSizeLoadSuccess(fontSize: fs) when FontSizeChanged',
        build: () => fontSizeBloc,
        act: (FontSizeBloc bloc) => bloc.add(const FontSizeChanged(17)),
        expect: <FontSizeState>[const FontSizeLoadSuccess(fontSize: 17)]);
  });
}
