import gql from 'graphql-tag'
import { Query } from "react-apollo";
import User from '../entities/User'

export interface GetLoggedInUserData {
    loggedInUser: User
}

export interface GetLoggedInUserVariables {
}

export const GetLoggedInUser = gql`
    query GetLoggedInUser {
        loggedInUser {
            id
            name
        }
    }
`

export class GetLoggedInUserQuery extends Query<GetLoggedInUserData, GetLoggedInUserVariables> {}

export default GetLoggedInUser