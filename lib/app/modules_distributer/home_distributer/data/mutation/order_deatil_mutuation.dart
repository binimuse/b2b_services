class GetdistributorMutation {
  dynamic getMydistributor() {
    return """
      query 
         {
           auth{
          distributor{
          shipmentsTo{
          
            id
            status
            arrival_time
            departure_time
          from{
                __typename
                ... on Warehouse{
                    id
                }
            }
        }
     }
    }
  
}
    """;
  }
}
