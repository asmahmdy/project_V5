String URL() {
  return "172.18.160.237:8000";
}

int idcus() {
  return 1;
}

int idfix() {
  return 1;
}

class Message {
  final String text;
  final DateTime date;
  final bool isSentByme;

  const Message({
    required this.text,
    required this.date,
    required this.isSentByme,
  });

  get messageType => null;
}
