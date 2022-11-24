class DriverMutation {
  dynamic getMyUserId() {
    return """
      query 
         {
          auth{
          driver{
            id
          name
         
         address
         city
     
         }
         }
      }
    """;
  }
}
