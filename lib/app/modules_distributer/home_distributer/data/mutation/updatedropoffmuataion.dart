class UpdatedropoffMutation {
  static const String updateDropoff = r'''
mutation updateDropoff($id: ID!, $order_received: Boolean!, $order_recived_id: ID!){
    updateDropoff(id: $id, input: {
        received: $order_received
        id: $order_recived_id
    }) {
        id
        
    }
}
 ''';
}

// ignore_for_file: file_names

