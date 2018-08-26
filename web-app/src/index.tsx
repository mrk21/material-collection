import * as React from 'react'
import { render } from 'react-dom'
import { ApolloProvider } from 'react-apollo'
import graphqlClient from './graphqlClient'
import AppComponent from './components/AppComponent'

const RootComponent = (
  <ApolloProvider client={graphqlClient}>
    <AppComponent />
  </ApolloProvider>
)

render(RootComponent, document.getElementById('app'))
