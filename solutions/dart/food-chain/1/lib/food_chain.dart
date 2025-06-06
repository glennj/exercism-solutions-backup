typedef Critter = ({String type, String saying});

class FoodChain {
  static final critters = const <Critter>[
    (
      type: 'fly',
      saying: "I don't know why she swallowed the fly. Perhaps she'll die."
    ),
    (type: 'spider', saying: 'It wriggled and jiggled and tickled inside her.'),
    (type: 'bird', saying: 'How absurd to swallow a bird!'),
    (type: 'cat', saying: 'Imagine that, to swallow a cat!'),
    (type: 'dog', saying: 'What a hog, to swallow a dog!'),
    (type: 'goat', saying: 'Just opened her throat and swallowed a goat!'),
    (type: 'cow', saying: "I don't know how she swallowed a cow!"),
    (type: 'horse', saying: "She's dead, of course!"),
  ];

  static final qualifier = const {
    'spider': ' that wriggled and jiggled and tickled inside her'
  };

  bool killer(String animal) => animal == 'horse';

  List<String> recite(int start, int end) {
    var result = <String>[];
    for (var i = start - 1; i < end; i++) {
      result.add('');
      result.addAll(verse(i));
    }
    return result.sublist(1);
  }

  List<String> verse(int i) {
    var result = <String>[];
    result.add('I know an old lady who swallowed a ${critters[i].type}.');
    result.add(critters[i].saying);

    if (killer(critters[i].type)) return result;

    for (var j = i - 1; j >= 0; j--) {
      result.add('She swallowed the ${critters[j + 1].type} to catch the ' +
          '${critters[j].type}${qualifier[critters[j].type] ?? ''}.');
    }
    if (i > 0) result.add(critters[0].saying);
    return result;
  }
}
