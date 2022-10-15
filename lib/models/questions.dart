class Question {
  final int? id, answer;
  final String? question;
  final List<String>? options;

  Question({this.id, this.question, this.answer, this.options});
}

List sampledata = [
  {
    "id": 1,
    "question": "When was the National Beagle Club formed?",
    "options": ['1988', '1888', '1978', '1878'],
    "answer_index": 1,
  },
  {
    "id": 2,
    "question": "What makes Beagle drool?",
    "options": ['Delicious Food', 'Toy', 'Other Beagle', 'Adventure'],
    "answer_index": 0,
  },
  {
    "id": 3,
    "question": "In which season Beagle starts shedding?",
    "options": ['Winter', 'Summer', 'Spring', 'None of the Above'],
    "answer_index": 2,
  },
  {
    "id": 4,
    "question": "Are beagles picky about their food?",
    "options": ['Yes', 'No', 'Maybe'],
    "answer_index": 1,
  },
  {
    "id": 5,
    "question": "Many beagles have white-tipped ______?",
    "options": ['Nose', 'Ears', 'Tail', 'None of the Above'],
    "answer_index": 2,
  },
  {
    "id": 6,
    "question": "What is the life expectancy of Beagless?",
    "options": ['12-15 years', '4-6 years', '9-11 years', '6-8 years'],
    "answer_index": 0,
  },
  {
    "id": 6,
    "question": "Beagles don’t like being left alone.",
    "options": ['True', 'False'],
    "answer_index": 0,
  },
];
