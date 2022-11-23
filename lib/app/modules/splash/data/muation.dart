class UpdateTokenMutation {
  static const String updateToken = r'''
    mutation updateFCMToken($token: String!){
    action: updateFCMToken(token: $token) {
        fcm_token
      }
    }
    ''';
}
