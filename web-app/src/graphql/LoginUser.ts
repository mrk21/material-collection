import gql from 'graphql-tag'
import { Mutation } from 'react-apollo'
import User from '../entities/User'

export interface LoginUserData {
  loginUser: {
    user: User
  }
}

export interface LoginUserVariables {
  email: string
  password: string
}

export const LoginUser = gql`
  mutation LoginUser($email: String!, $password: String!) {
    loginUser(email: $email, password: $password) {
      user {
        id
        name
      }
    }
  }
`

export class LoginUserMutation extends Mutation<
  LoginUserData,
  LoginUserVariables
> {}

export default LoginUser
