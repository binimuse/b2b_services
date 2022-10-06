class SigninQueryMutation {
  static const String signin = r'''
mutation($email :String!, $password: String!) {
    login(input: {
        email: $email
        password: $password
    }) {
        token
    }
}
 ''';
}
