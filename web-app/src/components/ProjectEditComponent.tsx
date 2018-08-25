
import * as React from 'react'
import { RouteComponentProps } from 'react-router'
import { Link } from 'react-router-dom'
import GetProject, { GetProjectQuery } from '../graphql/GetProject'
import UpdateProject, { UpdateProjectMutation } from '../graphql/UpdateProject'
import GetUser, { GetUserQuery } from '../graphql/GetUser'

export type ProjectEditComponentProps = RouteComponentProps<{ id: string }>

export const ProjectEditComponent = (props: ProjectEditComponentProps) => (
    <GetProjectQuery query={ GetProject } variables={ { id: props.match.params.id } }>
        {({ loading, data, error }) => {
            if (loading) return <div>loading...</div>
            if (error) return <div>{ error.toString() }</div>
            if (!data) return <div>project is not found</div>
            let titleNode: HTMLInputElement | null
            let descriptionNode: HTMLTextAreaElement | null
            return (
                <UpdateProjectMutation mutation={ UpdateProject }>
                    {(updateProject, { loading, error }) => (
                        <div>
                            <Link to={ `/projects/${data.project.id}` }>back</Link>
                            { loading ? <div>submitting...</div> : null }
                            { error ? <div>{ error.toString() }</div> : null }
                            <form onSubmit={(e) => {
                                e.preventDefault()
                                if (loading) return
                                updateProject({
                                    variables: {
                                        id: data.project.id,
                                        title: titleNode ? titleNode.value : '',
                                        description: descriptionNode ? descriptionNode.value : ''
                                    }
                                })
                            }}>
                                <p>#{ data.project.id } <input ref={(node) => { titleNode = node } } defaultValue={ data.project.title } /></p>
                                <p><textarea rows={10} cols={80} ref={(node) => { descriptionNode = node }} defaultValue={ data.project.description }></textarea></p>
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
                                <button type="submit" disabled={ loading }>submit</button>
                            </form>
                        </div>
                    )}
                </UpdateProjectMutation>
            )
        }}
    </GetProjectQuery>
)
export default ProjectEditComponent