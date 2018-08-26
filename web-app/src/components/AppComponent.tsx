import * as React from 'react'
import { BrowserRouter, Route, Link, Switch, Redirect } from 'react-router-dom'
import UserProjectsComponent from './UserProjectsComponent'
import ProjectComponent from './ProjectComponent'
import ProjectEditComponent from './ProjectEditComponent'
import GetLoggedInUser, {
  GetLoggedInUserQuery
} from '../graphql/GetLoggedInUser'
import LoginComponent from './LoginComponent'
import LogoutButtonComponent from './LogoutButtonComponent'

export const AppComponent = () => (
  <BrowserRouter>
    <div>
      <h1>
        <Link to="/">Material Collection</Link>
      </h1>
      <Switch>
        <Route exact path="/login" component={LoginComponent} />
        <GetLoggedInUserQuery query={GetLoggedInUser}>
          {({ loading, data, error }) => {
            if (loading) return <div>loading...</div>
            if (error || !data) return <Redirect to="/login" />
            return (
              <div>
                <div>
                  <p>{data.loggedInUser.name}</p>
                  <LogoutButtonComponent />
                </div>
                <Switch>
                  <Route exact path="/" component={UserProjectsComponent} />
                  <Route
                    exact
                    path="/projects/:id"
                    component={ProjectComponent}
                  />
                  <Route
                    exact
                    path="/projects/:id/edit"
                    component={ProjectEditComponent}
                  />
                </Switch>
              </div>
            )
          }}
        </GetLoggedInUserQuery>
      </Switch>
    </div>
  </BrowserRouter>
)
export default AppComponent
