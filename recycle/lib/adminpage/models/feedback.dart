// Model DataFeedback
class DataFeedback {
  static List<DataFeedback> datafeedbacks = [];
  String email;
  String description;
  String type;
  DateTime date;

  DataFeedback({
    required this.email,
    required this.description,
    required this.type,
    required this.date,
  });

  static void addDataFeedback({
    required email,
    required description,
    required type,
    required date,
  }) {
    datafeedbacks.add(DataFeedback(
      email: email,
      description: description,
      type: type,
      date: date,
    ));
  }
}
