// ignore_for_file: non_constant_identifier_names

class GestNotification {
  late String id;
  late String title;

  late String body;

  late bool seen;
  late String created_at;

  GestNotification(
      {required this.id,
      required this.title,
      required this.body,
      required this.seen,
      required this.created_at});
}
