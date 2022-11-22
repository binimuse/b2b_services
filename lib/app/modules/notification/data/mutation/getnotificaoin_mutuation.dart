class NotificationMutation {
  dynamic getNotification() {
    return """
      query 
         {
          notifications{
          
         id
         title
         body
         seen
         created_at
         }
      }
    """;
  }
}
