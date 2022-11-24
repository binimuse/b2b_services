class AcceptDropoffRequest {
  static const String request = r'''
mutation acceptDropoffRequest {
    acceptDropoffRequest {
        id
    }
}
 ''';
}

class RejectDropoffRequest {
  static const String request = r'''
mutation rejectDropoffRequest {
    rejectDropoffRequest {
        id
    }
}
 ''';
}
