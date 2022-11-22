class DriverMutation {
  dynamic getMyUserId() {
    return """
      query 
         {
          auth{
          driver{
          name
         id
         address
         city
     
         }
         }
      }
    """;
  }
}
