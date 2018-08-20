import gql from 'graphql-tag'
import { Query } from "react-apollo";
import Project from '../entities/Project'

export interface GetProjectData {
    project: Project
}

export interface GetProjectVariables {
    id: string
}

export const GetProject = gql`
    query GetProject($id: String!) {
        project(id: $id) {
            id
            ownerId
            title
            description
        }
    }
`

export class GetProjectQuery extends Query<GetProjectData, GetProjectVariables> {}

export default GetProject