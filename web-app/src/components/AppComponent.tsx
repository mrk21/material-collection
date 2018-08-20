import * as React from 'react'
import { BrowserRouter, Route, Link } from 'react-router-dom'
import UserProjectsComponent from './UserProjectsComponent'
import ProjectComponent from './ProjectComponent'

export const AppComponent = () => (
    <BrowserRouter>
        <div>
            <h1><Link to="/">Material Collection</Link></h1>
            <Route exact path='/' component={ UserProjectsComponent } />
            <Route path='/projects/:id' component={ ProjectComponent } />
        </div>
    </BrowserRouter>
)
export default AppComponent