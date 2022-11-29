class UpdateDropoff {
  static const String request = r'''
mutation updateDropoff($id: ID!,$status: DropoffStatusType!) {
    updateDropoff(id: $id, input:
    
    {
      status: $status
    }
    ) {
        id
    }
}
 ''';
}
