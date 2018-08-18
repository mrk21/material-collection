import * as React from 'react'
import { render } from 'react-dom'
import { ApolloProvider } from "react-apollo";
import graphqlClient from './graphqlClient'
import UserProjectsComponent from './components/UserProjectsComponent'

const RootComponent = (
    <ApolloProvider client={ graphqlClient }>
        <UserProjectsComponent />
    </ApolloProvider>
)

render(RootComponent, document.getElementById('app'))
