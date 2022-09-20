/// Задача, сгруппировать слова по общим группам
/// ['eat', 'tea', 'tan', 'ate', 'nat', 'bat']

void main() {
  final words = ['dbt', 'tea', 'tan', 'ate', 'nat', 'bat', 'tab'];
  print(groupWords(words));
}

List<List<String>> groupWords(List<String> words) {
  final Map<String, List<String>> groups = {};

  for (final word in words) {
    final key = _getKey(word);
    print(key);
    if (groups.containsKey(key)) {
      groups[key]?.add(word);
    } else {
      groups[key] = List<String>.from([word]);
    }
  }

  final List<List<String>> result = [];
  groups.forEach((key, value) => result.add(value));

  return result;
}

String _getKey(String word) {
  final sorted = word.split('')..sort();
  return sorted.join();
}

// String _getKey(String word) {
//   final counter = {};
//   for (final unit in word.codeUnits) {
//     counter.update(unit, (value) => value + 1, ifAbsent: () => 1);
//   }
//   final sortedKeys = counter.keys.toList()..sort();
//   String res = '';
//   for (final k in sortedKeys) {
//     res += '/${k}-${counter[k]}';
//   }
//   return res;
// }
