import * as React from 'react'
import { render } from 'react-dom'
import { ApolloProvider } from "react-apollo";
import HogeListComponent from './components/HogeListComponent'
import graphqlClient from './graphqlClient'

const RootComponent = (
    <ApolloProvider client={ graphqlClient }>
        <HogeListComponent />
    </ApolloProvider>
)

render(RootComponent, document.getElementById('app'))
