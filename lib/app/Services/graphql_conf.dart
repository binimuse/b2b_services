import "package:flutter/material.dart";
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GraphQLConfiguration {
  static HttpLink httpLink = HttpLink(
    "http://157.230.102.54:8081/graphql",
  );

  ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      link: httpLink,
      cache: GraphQLCache(),
    ),
  );

  static AuthLink authLink = AuthLink(getToken: () async {
    final prefs = await SharedPreferences.getInstance();
    return "Bearer ${prefs.getString('access_token')}";
  });

  final Link link = authLink.concat(httpLink);

  GraphQLClient clientToQuery() {
    return GraphQLClient(
      cache: GraphQLCache(),
      link: link,
    );
  }
}
