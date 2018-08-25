
import * as React from 'react'
import { RouteComponentProps } from 'react-router'
import { Link } from 'react-router-dom'
import GetProject, { GetProjectQuery } from '../graphql/GetProject'
import GetUser, { GetUserQuery } from '../graphql/GetUser'
import GetProjectAssets, { GetProjectAssetsQuery } from '../graphql/GetProjectAssets'

export type ProjectComponentProps = RouteComponentProps<{ id: string }>

export const ProjectComponent = (props: ProjectComponentProps) => (
    <GetProjectQuery query={ GetProject } variables={ { id: props.match.params.id } } >
        {({ loading, data, error }) => {
            if (loading) return <div>loading...</div>
            if (error) return <div>{ error.toString() }</div>
            if (!data) return <div>project is not found</div>
            return (
                <div>
                    <p style={ { fontSize: '150%', fontWeight: 'bold' } }>#{ data.project.id } { data.project.title }</p>
                    <p>{ data.project.description }</p>
                    <Link to={ `/` }>back</Link>&nbsp;
                    <Link to={ `/projects/${ data.project.id }/edit` }>edit</Link>
                    <div style={ { marginLeft: '20px' } }>
                        <p style={ { fontWeight: 'bold' } }>Owner:</p>
                        <div style={ { marginLeft: '20px' } }>
                            <GetUserQuery query={ GetUser } variables={ { id: data.project.ownerId } } >
                                {({ loading, data, error }) => {
                                    if (loading) return <div>loading...</div>
                                    if (error) return <div>{ error.toString() }</div>
                                    if (!data) return <div>owner is nothing</div>
                                    return (
                                        <div>
                                            <p>#{ data.user.id } { data.user.name }</p>
                                        </div>
                                    )
                                }}
                            </GetUserQuery>
                        </div>
                    </div>

                    <div style={ { marginLeft: '20px' } }>
                        <p style={ { fontWeight: 'bold' } }>Posted Assets:</p>
                        <div style={ { marginLeft: '20px' } }>
                            <GetProjectAssetsQuery query={ GetProjectAssets } variables={ { projectId: data.project.id } }>
                                {({ loading, data, error }) => {
                                    if (loading) return <div>loading...</div>
                                    if (error) return <div>{ error.toString() }</div>
                                    if (!data) return <div>posted assets are empty</div>
                                    return (
                                        data.projectAssets.map((asset) => (
                                            <div>
                                                <p>#{ asset.id } { asset.title }</p>
                                                <div style={ { marginLeft: '20px' } }>
                                                    <p>Author:</p>
                                                    <div style={ { marginLeft: '20px' } }>
                                                        <GetUserQuery query={ GetUser } variables={ { id: asset.authorId } } >
                                                            {({ loading, data, error }) => {
                                                                if (loading) return <div>loading...</div>
                                                                if (error) return <div>{ error.toString() }</div>
                                                                if (!data) return <div>author is nothing</div>
                                                                return (
                                                                    <div>
                                                                        <p>#{ data.user.id } { data.user.name }</p>
                                                                    </div>
                                                                )
                                                            }}
                                                        </GetUserQuery>
                                                    </div>
                                                </div>
                                            </div>
                                        ))
                                    )
                                }}
                            </GetProjectAssetsQuery>
                        </div>
                    </div>
                </div>
            )
        }}
    </GetProjectQuery>
)
export default ProjectComponent