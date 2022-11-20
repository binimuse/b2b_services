class UserIdMutation {
  dynamic getMyUserId() {
    return """
      query 
         {
          auth{
          distributor{
          name
         id
         address
         city
         contact_phone
         contact_email
         }
         }
      }
    """;
  }
}
