const String getUser = r'''
query ReadUser($nUserId: ID!){
  user(id: $nUserId){
    address
    email
    firstName
    id
    lastName
    middleName
    phone
  }
}
''';
