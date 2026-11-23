import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_cocuklar_icin_blok_kodlama/oyun_cocuklar_icin_blok_kodlama.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(blokKodlamaConfig.title.length, 33);
    expect(blokKodlamaConfig.tagline.length, 33);
    for (final s in blokKodlamaConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(blokKodlamaConfig.gameId, blokKodlamaId);
    expect(blokKodlamaRules.gameId, blokKodlamaId);
    expect(blokKodlamaConfig.kidsMode, isTrue);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(blokKodlamaRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: blokKodlamaId, optionalMechanics: blokKodlamaRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(blokKodlamaRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
