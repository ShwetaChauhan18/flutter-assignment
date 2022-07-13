class Question {
  List<String>? incorrect;
  String? text;
  String? correct;

  Question({this.incorrect, this.text, this.correct});

  Question.fromJson(Map<String, dynamic> json) {
    incorrect = json['incorrect'].cast<String>();
    text = json['text'];
    correct = json['correct'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['incorrect'] = this.incorrect;
    data['text'] = this.text;
    data['correct'] = this.correct;
    return data;
  }
}

class Questions {
  final List<Question> _items = [
    Question(
      incorrect: [
        "Machine learning causes global warming",
        "Unsecure networks lead to terrorist attacks",
        "NFTs contribute to poaching of animals"
      ],
      text: 'What is one potential environmental concern about Web 3.0?',
      correct: 'Blockchains can use a lot of energy',
    ),
    Question(
      incorrect: [
        "Paying someone through PayPal",
        "Buying something on Amazon.com",
        "Taking a screenshot of an NFT"
      ],
      text:
          'Which of the following is an example of a trustless transaction that takes place on Web 3.0?',
      correct: 'Sending Bitcoin to someone else',
    ),
  ];

  List<Question> get items {
    return [..._items];
  }
}
