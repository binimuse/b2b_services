class StatusMutation {
  static const String status = r'''
mutation toggleDriverStatus {
    toggleDriverStatus {
        is_on
    }
}
 ''';
}
