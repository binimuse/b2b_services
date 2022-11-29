class CreateDropoffMutation {
  static const String createDropoff = r'''
mutation createDropoff($vehicle_type: CreateVehicleTypeBelongsTo!, $from: CreateDropoffFromMorphTo!, $orders: CreateDropoffOrdersInput!){
    createDropoff(input: {
        vehicle_type: $vehicle_type
        from: $from
        orders: $orders
    }) {
        id
        
    }
}
 ''';
}

// ignore_for_file: file_names

