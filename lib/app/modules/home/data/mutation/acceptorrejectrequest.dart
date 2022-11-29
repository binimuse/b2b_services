class AcceptDropoffRequest {
  static const String request = r'''
mutation acceptDropoffRequest($dropoff_id: ID!) {
    acceptDropoffRequest(dropoff_id: $dropoff_id) {
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
