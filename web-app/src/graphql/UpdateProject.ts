import gql from 'graphql-tag'
import { Mutation } from 'react-apollo'
import Project from '../entities/Project'

export interface UpdateProjectData {
  updateProject: {
    project: Project
  }
}

export interface UpdateProjectVariables {
  id: string
  title: string
  description: string | null
}

export const UpdateProject = gql`
  mutation UpdateProject($id: IDString!, $title: String!, $description: String) {
    updateProject(id: $id, title: $title, description: $description) {
      project {
        id
        ownerId
        title
        description
      }
    }
  }
`

export class UpdateProjectMutation extends Mutation<
  UpdateProjectData,
  UpdateProjectVariables
> {}

export default UpdateProject
