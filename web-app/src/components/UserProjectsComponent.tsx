import * as React from 'react'
import { Link } from 'react-router-dom'
import GetUserProjects, {
  GetUserProjectsQuery
} from '../graphql/GetUserProjects'
import GetUser, { GetUserQuery } from '../graphql/GetUser'
import GetProjectAssets, {
  GetProjectAssetsQuery
} from '../graphql/GetProjectAssets'
import GetLoggedInUser, {
  GetLoggedInUserQuery
} from '../graphql/GetLoggedInUser'

export const UserProjectsComponent = () => (
  <GetLoggedInUserQuery query={GetLoggedInUser}>
    {({ loading, data, error }) => {
      if (loading) return <div>loading...</div>
      if (error || !data) return <Redirect to="/login" />
      return (
        <GetUserProjectsQuery query={GetUserProjects} variables={{ userId: data.loggedInUser.id }}>
          {({ loading, data, error }) => {
            if (loading) return <div>loading...</div>
            if (error) return <div>{error.toString()}</div>
            if (!data) return <div>projects are empty</div>
            return data.userProjects.nodes.map(project => (
              <div>
                <p style={{ fontSize: '150%', fontWeight: 'bold' }}>
                  #{project.id} {project.title}
                </p>
                <p>
                  <Link to={`/projects/${project.id}`}>detail</Link>
                </p>
                <div style={{ marginLeft: '20px' }}>
                  <p style={{ fontWeight: 'bold' }}>Owner:</p>
                  <div style={{ marginLeft: '20px' }}>
                    <GetUserQuery query={GetUser} variables={{ id: project.ownerId }}>
                      {({ loading, data, error }) => {
                        if (loading) return <div>loading...</div>
                        if (error) return <div>{error.toString()}</div>
                        if (!data) return <div>owner is nothing</div>
                        return (
                          <div>
                            <p>
                              #{data.user.id} {data.user.name}
                            </p>
                          </div>
                        )
                      }}
                    </GetUserQuery>
                  </div>
                </div>

                <div style={{ marginLeft: '20px' }}>
                  <p style={{ fontWeight: 'bold' }}>Posted Assets:</p>
                  <div style={{ marginLeft: '20px' }}>
                    <GetProjectAssetsQuery
                      query={GetProjectAssets}
                      variables={{ projectId: project.id }}
                    >
                      {({ loading, data, error }) => {
                        if (loading) return <div>loading...</div>
                        if (error) return <div>{error.toString()}</div>
                        if (!data) return <div>posted assets are empty</div>
                        return data.projectAssets.nodes.map(asset => (
                          <div>
                            <p>
                              #{asset.id} {asset.title}
                            </p>
                            <div style={{ marginLeft: '20px' }}>
                              <p>Author:</p>
                              <div style={{ marginLeft: '20px' }}>
                                <GetUserQuery
                                  query={GetUser}
                                  variables={{ id: asset.authorId }}
                                >
                                  {({ loading, data, error }) => {
                                    if (loading) return <div>loading...</div>
                                    if (error) return <div>{error.toString()}</div>
                                    if (!data) return <div>author is nothing</div>
                                    return (
                                      <div>
                                        <p>
                                          #{data.user.id} {data.user.name}
                                        </p>
                                      </div>
                                    )
                                  }}
                                </GetUserQuery>
                              </div>
                            </div>
                          </div>
                        ))
                      }}
                    </GetProjectAssetsQuery>
                  </div>
                </div>
              </div>
            ))
          }}
        </GetUserProjectsQuery>
      )
    }}
  </GetLoggedInUserQuery>
)
export default UserProjectsComponent
