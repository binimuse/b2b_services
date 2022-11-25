class GetDropOff {
  dynamic dropoff(
    int id,
  ) {
    return """
query {
    dropoff(id: $id) {
       id
    status
    from {
      ...on Distributor {
        id
        name
      }
    }
    driver {
      id
      name
    }
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
          }
        }
      }
    }
    }
}
    """;
  }
}
