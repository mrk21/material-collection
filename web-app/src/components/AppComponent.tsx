import * as React from 'react'
import { BrowserRouter, Route, Link } from 'react-router-dom'
import UserProjectsComponent from './UserProjectsComponent'
import ProjectComponent from './ProjectComponent'
import ProjectEditComponent from './ProjectEditComponent'

export const AppComponent = () => (
    <BrowserRouter>
        <div>
            <h1><Link to="/">Material Collection</Link></h1>
            <Route exact path='/' component={ UserProjectsComponent } />
            <Route exact path='/projects/:id' component={ ProjectComponent } />
            <Route exact path='/projects/:id/edit' component={ ProjectEditComponent } />
        </div>
    </BrowserRouter>
)
export default AppComponent