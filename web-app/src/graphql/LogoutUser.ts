import gql from 'graphql-tag'
import { Mutation } from 'react-apollo'

export interface LogoutUserData {
  logoutUser: {
    ok: boolean
  }
}

export interface LogoutUserVariables {}

export const LogoutUser = gql`
  mutation LogoutUser {
    logoutUser {
      ok
    }
  }
`

export class LogoutUserMutation extends Mutation<
  LogoutUserData,
  LogoutUserVariables
> {}

export default LogoutUser
