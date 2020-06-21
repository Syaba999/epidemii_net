/*
const String userLogin = r'''
  mutation UserLogin($email: String!, $password: String!){
    userLogin(email: $email, password: $password){
      authenticatable
      credentials
    }
  }
''';
*/
const String userLogin = r'''
mutation UserLogin($email: String!, $password: String!){
  userLogin(email: $email, password: $password){
    authenticatable {
      id
      email
      firstName
      lastName
      middleName
      address
      phone
      notices {
        id
        title
      }
    }
  }
}
''';
const String userSignUp = r'''
mutation UserSignUp($email: String!, $password: String!, $passwordConfirmation: String!, $firstName: String!, $lastName: String!, $phone: String!, $address: String!, $middleName: String!){
  userSignUp(email: $email, password: $password, passwordConfirmation: $passwordConfirmation, firstName: $firstName, lastName: $lastName, phone: $phone, address: $address, middleName: $middleName){
    address
    email
    firstName
    id
    lastName
    middleName
    notices {
      id
      title
    }
    phone
  }
}
''';
