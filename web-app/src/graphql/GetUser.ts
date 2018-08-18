import gql from 'graphql-tag'
import { Query } from "react-apollo";
import User from '../entities/User'

export interface GetUserData {
    user: User
}

export interface GetUserVariables {
    id: string
}

export const GetUser = gql`
    query GetUser($id: String!) {
        user(id: $id) {
            id
            name
        }
    }
`

export class GetUserQuery extends Query<GetUserData, GetUserVariables> {}

export default GetUser