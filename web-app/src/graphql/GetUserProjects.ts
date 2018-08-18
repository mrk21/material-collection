import gql from 'graphql-tag'
import { Query } from "react-apollo";
import Project from '../entities/Project'

export interface GetUserProjectsData {
    userProjects: Array<Project>
}

export interface GetUserProjectsVariables {
    userId: string
}

export const GetUserProjects = gql`
    query GetUserProjects($userId: String!) {
        userProjects(userId: $userId) {
            id
            ownerId
            title
            description
        }
    }
`

export class GetUserProjectsQuery extends Query<GetUserProjectsData, GetUserProjectsVariables> {}

export default GetUserProjects