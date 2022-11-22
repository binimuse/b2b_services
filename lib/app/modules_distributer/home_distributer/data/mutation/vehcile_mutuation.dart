class VehicleTypesMutation {
  dynamic getMyCvehicleTypes(int first, int page) {
    return """
query {
    vehicleTypes(first: $first, page: $page) {
        data {
             id
            title
            image
            
        
        }
    }
}
    """;
  }
}
