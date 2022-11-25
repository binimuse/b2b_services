class GetDropOff {
  dynamic dropoff(
    String id,
  ) {
    return """
query {
    dropoff(id: $id) {
       id
    status
 
    dropoff_order {
      id
      received
      order {
        id
        total_price
        retailer {
          name
        }
        items {
          id
          quantity
          product_sku {
            id
            sku
             product
            {
                name
            }
          }
        }
      }
    }
    }
}
    """;
  }
}
