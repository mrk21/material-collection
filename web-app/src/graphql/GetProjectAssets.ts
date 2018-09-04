import gql from 'graphql-tag'
import { Query } from 'react-apollo'
import Asset from '../entities/Asset'

export interface GetProjectAssetsData {
  projectAssets: {
    nodes: Array<Asset>
  }
}

export interface GetProjectAssetsVariables {
  projectId: string
}

export const GetProjectAssets = gql`
  query GetProjectAssets($projectId: IDString!) {
    projectAssets(projectId: $projectId) {
      nodes {
        id
        authorId
        title
        description
      }
    }
  }
`

export class GetProjectAssetsQuery extends Query<
  GetProjectAssetsData,
  GetProjectAssetsVariables
> {}

export default GetProjectAssets
