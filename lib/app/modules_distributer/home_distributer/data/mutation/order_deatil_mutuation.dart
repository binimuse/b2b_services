class GetdistributorMutation {
  dynamic getMydistributor() {
    return """
query {
  auth {
    name
    role

    distributor {
      id
      shipmentsTo {
        id
        status
        arrival_time
        departure_time
        items {
          id
          shipment_itemable {
            __typename
            ... on OrderItem {
              id
              quantity
              product_sku {
                id
                sku
                price
                product {
                  name
                  images {
                    id
                    original_url
                  }
                }
                variants {
                  attribute {
                    name
                  }
                  attributeValue {
                    value
                  }
                }
              }
            }
          }
        }
        from {
            
          ... on Warehouse {
            id
            name
          }
          ... on Distributor {
            id
            name
          }
        }
      }

    }
  }
}
    """;
  }
}

class GetOrderrMutation {
  dynamic getMyorder() {
    return """
query {
  auth {
  
  
    distributor {
      id
      orders {
       id
       items {
          id
          quantity
          product_sku {
              sku
              price
              product {
                name
                images {
                    id
                    original_url
                }
                attributes {
                    id
                    name
                }
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
